import 'package:absen_app/activity/data/data_provider.dart';
import 'package:absen_app/activity/domain/domain_provider.dart';
import 'package:absen_app/activity/presentation/notifier/activity_notifier.dart';
import 'package:absen_app/activity/presentation/notifier/pdf_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final activityNotifierProvider =
    StateNotifierProvider<ActivityNotifier, ActivityState>(
  (ref) {
    return ActivityNotifier(
      addActivityUseCase: ref.watch(addActivityProvider),
      editActivityUseCase: ref.watch(editActivityProvider),
      deleteActivityUseCase: ref.watch(deleteActivityProvider),
      fetchUserActivityUseCase: ref.watch(fetchUserActivityProvider),
      getActivityByIdUseCase: ref.watch(getActivityByIdProvider),
      deleteFileUseCase: ref.watch(deleteFileProvider),
      storeFileUseCase: ref.watch(storeFileProvider),
      ref: ref,
    );
  },
);

final pdfNotifierProvider = StateNotifierProvider<PDFNotifier, bool>(
  (ref) => PDFNotifier(
    pdfRepository: ref.watch(pdfRepositoryProvider),
    ref: ref,
  ),
);
