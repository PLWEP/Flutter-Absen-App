import 'dart:io';
import 'dart:typed_data';

import 'package:absen_app/model/activity_model.dart';
import 'package:absen_app/model/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

void generateReport(List<Activity> data, UserModel user) async {
  const PdfPageFormat pageFormat = PdfPageFormat.a4;
  final report = Report(
    activities: data,
    user: user,
    baseColor: PdfColors.white,
  );

  final output = await getDownloadsDirectory();
  final file = File("${output!.path}/example.pdf");
  await file.writeAsBytes(await report.buildPdf(pageFormat));
}

class Report {
  Report({
    required this.user,
    required this.activities,
    required this.baseColor,
  });

  final UserModel user;
  final List<Activity> activities;
  final PdfColor baseColor;

  static const _darkColor = PdfColors.blueGrey800;
  static const _lightColor = PdfColors.white;

  PdfColor get _baseTextColor => baseColor.isLight ? _lightColor : _darkColor;

  Future<Uint8List> buildPdf(PdfPageFormat pageFormat) async {
    final doc = pw.Document();
    final netImage = [];
    for (var activity in activities) {
      netImage.add(await networkImage(activity.documentation));
    }

    doc.addPage(
      pw.MultiPage(
        pageTheme: pw.PageTheme(
          pageFormat: pageFormat,
          theme: pw.ThemeData(),
        ),
        build: (context) => [
          pw.Center(
            child: pw.Center(
              child: pw.Text('Absen Report ${user.name}'),
            ),
          ),
          pw.SizedBox(height: 10),
          _contentTable(context, netImage),
        ],
      ),
    );

    return doc.save();
  }

  pw.Widget _contentTable(
    pw.Context context,
    List<dynamic> netImage,
  ) {
    const tableHeaders = [
      'Date',
      'Title',
      'Description',
      'Documentation',
    ];

    return pw.TableHelper.fromTextArray(
      border: null,
      cellAlignment: pw.Alignment.center,
      headerDecoration: const pw.BoxDecoration(
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(2)),
      ),
      headerHeight: 25,
      cellHeight: 40,
      cellAlignments: {
        0: pw.Alignment.center,
        1: pw.Alignment.center,
        2: pw.Alignment.center,
        3: pw.Alignment.center,
      },
      headerStyle: pw.TextStyle(
        color: _baseTextColor,
        fontSize: 15,
        fontWeight: pw.FontWeight.bold,
      ),
      cellStyle: const pw.TextStyle(
        color: _darkColor,
        fontSize: 10,
      ),
      rowDecoration: const pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            width: .5,
          ),
        ),
      ),
      headers: List<String>.generate(
        tableHeaders.length,
        (col) => tableHeaders[col],
      ),
      data: List<List<dynamic>>.generate(
        activities.length,
        (row) {
          return [
            activities[row].date,
            activities[row].title,
            activities[row].description,
            pw.Image(
              netImage[row],
              width: 100,
            ),
          ];
        },
      ),
    );
  }
}
