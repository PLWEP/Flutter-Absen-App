import 'package:absen_app/common/failure.dart';
import 'package:absen_app/data/models/activity.dart';
import 'package:fpdart/fpdart.dart';

abstract class ActivityRepository {
  Future<Either<Failure, void>> addActivity(Activity activity);
  Stream<Either<Failure, List<Activity>>> fetchUserActivity(String uid);
  Future<Either<Failure, void>> deleteActivity(Activity activity);
  Stream<Either<Failure, Activity>> getActivityById(String activityId);
  Future<Either<Failure, void>> editActivity(Activity activity);
}
