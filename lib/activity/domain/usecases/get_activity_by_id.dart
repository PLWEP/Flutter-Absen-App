import 'package:absen_app/common/failure.dart';
import 'package:absen_app/activity/data/model/activity.dart';
import 'package:absen_app/activity/domain/repository/activity_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetActivityById {
  final ActivityRepository repository;

  GetActivityById(this.repository);

  Future<Either<Failure, Activity>> execute(String activityId) {
    return repository.getActivityById(activityId);
  }
}
