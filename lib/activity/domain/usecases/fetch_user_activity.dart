import 'package:absen_app/common/failure.dart';
import 'package:absen_app/activity/data/model/activity.dart';
import 'package:absen_app/activity/domain/repository/activity_repository.dart';
import 'package:fpdart/fpdart.dart';

class FetchUserActivity {
  final ActivityRepository repository;

  FetchUserActivity(this.repository);

  Future<Either<Failure, List<Activity>>> execute(String uid) {
    return repository.fetchUserActivity(uid);
  }
}
