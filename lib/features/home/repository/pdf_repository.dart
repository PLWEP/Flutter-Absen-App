import 'dart:io';

import 'package:absen_app/common/failure.dart';
import 'package:absen_app/common/type_def.dart';
import 'package:absen_app/data/model/activity_model.dart';
import 'package:absen_app/data/model/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDFRepository {
  PDFRepository({
    required this.baseColor,
  });

  final PdfColor baseColor;

  static const _darkColor = PdfColors.blueGrey800;
  static const _lightColor = PdfColors.white;

  PdfColor get _baseTextColor => baseColor.isLight ? _lightColor : _darkColor;

  static const tableHeaders = [
    'Date',
    'Title',
    'Description',
    'Documentation',
  ];

  FutureEither<String> buildPdf(
    PdfPageFormat pageFormat,
    UserModel user,
    List<Activity> activities,
  ) async {
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
          pw.TableHelper.fromTextArray(
            border: pw.TableBorder.all(),
            cellAlignment: pw.Alignment.center,
            headerHeight: 25,
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
            headers: List<String>.generate(
              tableHeaders.length,
              (col) => tableHeaders[col],
            ),
            data: List<List<dynamic>>.generate(
              activities.length,
              (row) => [
                pw.Container(
                  width: 150,
                  padding: const pw.EdgeInsets.all(10),
                  child: pw.Center(
                    child: pw.Text(
                      DateFormat.yMEd().format(activities[row].date).toString(),
                    ),
                  ),
                ),
                pw.Container(
                  width: 200,
                  padding: const pw.EdgeInsets.all(10),
                  child: pw.Center(
                    child: pw.Text(
                      activities[row].title,
                    ),
                  ),
                ),
                pw.Container(
                  padding: const pw.EdgeInsets.all(10),
                  child: pw.Center(
                    child: pw.Text(
                      activities[row].description,
                      textAlign: pw.TextAlign.justify,
                    ),
                  ),
                ),
                pw.Container(
                  width: 250,
                  child: pw.Center(
                    child: pw.Image(
                      netImage[row],
                      width: 75,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    try {
      final output = await getDownloadsDirectory();
      final path = "${output!.path}/${user.name} report.pdf";
      final file = File(path);
      await file.writeAsBytes(await doc.save());
      return right(path);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
