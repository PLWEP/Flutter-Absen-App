import 'package:absen_app/activity/domain/domain_provider.dart';
import 'package:absen_app/activity/presentation/notifier/activity_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final activityNotifierProvider =
    StateNotifierProvider<ActivityNotifier, ActivityState>(
  (ref) {
    return ActivityNotifier(
      addActivityUseCase: ref.watch(addActivityProvider),
      editActivityUseCase: ref.watch(editActivityProvider),
      deleteActivityUseCase: ref.watch(deleteActivityProvider),
      fetchUserActivityUseCase: ref.watch(fetchUserActivityProvider),
      deleteFileUseCase: ref.watch(deleteFileProvider),
      storeFileUseCase: ref.watch(storeFileProvider),
      ref: ref,
    );
  },
);
