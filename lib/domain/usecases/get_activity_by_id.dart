import 'package:absen_app/common/failure.dart';
import 'package:absen_app/data/models/activity.dart';
import 'package:absen_app/domain/repositories/activity_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetActivityById {
  final ActivityRepository repository;

  GetActivityById(this.repository);

  Either<Failure, Stream<Activity>> execute(String activityId) {
    return repository.getActivityById(activityId);
  }
}
