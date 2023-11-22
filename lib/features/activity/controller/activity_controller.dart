import 'dart:io';

import 'package:absen_app/common/repository/storage_repository.dart';
import 'package:absen_app/features/activity/repository/activity_repository.dart';
import 'package:absen_app/features/auth/provider/auth_provider.dart';
import 'package:absen_app/model/activity_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:absen_app/common/utils.dart';
import 'package:uuid/uuid.dart';

class ActivityController extends StateNotifier<bool> {
  final ActivityRepository _activityRepository;
  final Ref _ref;
  final StorageRepositorty _storageRepository;

  ActivityController(
      {required ActivityRepository activityRepository,
      required Ref ref,
      required StorageRepositorty storageRepository})
      : _activityRepository = activityRepository,
        _storageRepository = storageRepository,
        _ref = ref,
        super(false);

  void addActivity({
    required BuildContext context,
    required String title,
    required String description,
    required DateTime date,
    required File? file,
  }) async {
    state = true;
    String activityId = const Uuid().v1();
    final user = _ref.read(userProvider)!;
    final imageRes = await _storageRepository.storeFile(
      path: 'activity',
      id: activityId,
      file: file,
    );

    imageRes.fold(
      (l) => showSnackBar(context, l.message),
      (r) async {
        final Activity activity = Activity(
          id: activityId,
          uid: user.uid,
          title: title,
          description: description,
          date: date,
          documentation: r,
        );

        final res = await _activityRepository.addActivity(activity);
        state = false;
        res.fold(
          (l) => showSnackBar(context, l.message),
          (r) {
            showSnackBar(context, "Activity added successfully");
            Routemaster.of(context).pop();
          },
        );
      },
    );
  }

  Stream<List<Activity>> fetchUserActivity(String uid) {
    return _activityRepository.fetchUserActivity(uid);
  }

  void deleteActivity(BuildContext context, Activity activity) async {
    final res = await _activityRepository.deleteActivity(activity);
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) => showSnackBar(context, "Delete activity successfully"),
    );
  }

  Stream<Activity> getPostById(String activityId) =>
      _activityRepository.getActivityById(activityId);
}
