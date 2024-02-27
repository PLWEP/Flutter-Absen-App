import 'package:absen_app/features/auth/provider/auth_provider.dart';
import 'package:absen_app/features/home/repository/pdf_repository.dart';
import 'package:absen_app/data/model/activity_model.dart';
import 'package:absen_app/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf/pdf.dart';

class PDFController extends StateNotifier<bool> {
  final PDFRepository _pdfRepository;
  final Ref _ref;
  PDFController({required PDFRepository pdfRepository, required Ref ref})
      : _pdfRepository = pdfRepository,
        _ref = ref,
        super(false);

  void exportPDF(BuildContext context, List<Activity> activities) async {
    final user = _ref.read(userProvider)!;
    const PdfPageFormat pageFormat = PdfPageFormat.a4;

    state = true;
    final result = await _pdfRepository.buildPdf(pageFormat, user, activities);
    state = false;
    result.fold(
      (l) => showSnackBar(context, l.message),
      (r) => showSnackBar(context, "PDF exported in $r"),
    );
  }
}
