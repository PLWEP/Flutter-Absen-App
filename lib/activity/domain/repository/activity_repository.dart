import 'dart:io';

import 'package:absen_app/common/failure.dart';
import 'package:absen_app/activity/data/model/activity.dart';
import 'package:fpdart/fpdart.dart';

abstract class ActivityRepository {
  Future<Either<Failure, void>> addActivity(Activity activity);
  Future<Either<Failure, List<Activity>>> fetchUserActivity(String uid);
  Future<Either<Failure, void>> deleteActivity(Activity activity);
  Future<Either<Failure, Activity>> getActivityById(String activityId);
  Future<Either<Failure, void>> editActivity(Activity activity);

  Future<Either<Failure, String>> storeFile(String path, String id, File? file);
  Future<Either<Failure, void>> deleteFile(String path, String id);
}
