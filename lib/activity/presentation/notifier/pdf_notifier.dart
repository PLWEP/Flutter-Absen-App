import 'package:absen_app/activity/data/model/activity.dart';
import 'package:absen_app/activity/data/repository/pdf_repository.dart';
import 'package:absen_app/auth/presentation/presentation_provider.dart';
import 'package:absen_app/common/key.dart';
import 'package:absen_app/common/snackbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf/pdf.dart';

class PDFNotifier extends StateNotifier<bool> {
  final PDFRepository _pdfRepository;
  final Ref _ref;
  PDFNotifier({required PDFRepository pdfRepository, required Ref ref})
      : _pdfRepository = pdfRepository,
        _ref = ref,
        super(false);

  void exportPDF(List<Activity> activityList) async {
    final user = _ref.read(authNotifierProvider).userData!;
    const PdfPageFormat pageFormat = PdfPageFormat.a4;

    state = true;
    final result =
        await _pdfRepository.buildPdf(pageFormat, user, activityList);
    state = false;
    result.fold(
      (l) => snackbarKey.currentState
          ?.showSnackBar(showSnackBarWithoutContextRed(l.message)),
      (r) => snackbarKey.currentState
          ?.showSnackBar(showSnackBarWithoutContextGreen("PDF exported in $r")),
    );
  }
}
