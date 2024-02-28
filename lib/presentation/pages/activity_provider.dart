// import 'package:absen_app/common/firebase_provider.dart';
// import 'package:absen_app/common/repository/storage_repository.dart';
// import 'package:absen_app/features/activity/controller/activity_controller.dart';
// import 'package:absen_app/features/activity/repository/activity_repository.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final userActivityProvider = StreamProvider(
//   (ref) => ref.watch(activityControllerProvider.notifier).fetchUserActivity(),
// );

// final getActivityByIdProvider = StreamProvider.family(
//   (ref, String activityId) =>
//       ref.watch(activityControllerProvider.notifier).getPostById(activityId),
// );

// final activityControllerProvider =
//     StateNotifierProvider<ActivityController, bool>(
//   (ref) {
//     final activityRepository = ref.watch(activityRepositoryProvider);
//     final storageRepository = ref.watch(storageRepositoryProvider);
//     return ActivityController(
//       ref: ref,
//       activityRepository: activityRepository,
//       storageRepository: storageRepository,
//     );
//   },
// );

// final activityRepositoryProvider = Provider(
//   (ref) => ActivityRepository(
//     firestore: ref.watch(firestoreProvider),
//   ),
// );
