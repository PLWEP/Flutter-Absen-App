import 'package:absen_app/common/failure.dart';
import 'package:absen_app/data/models/activity.dart';
import 'package:absen_app/domain/repositories/activity_repository.dart';
import 'package:fpdart/fpdart.dart';

class FetchUserActivity {
  final ActivityRepository repository;

  FetchUserActivity(this.repository);

  Either<Failure, Stream<List<Activity>>> execute(String uid) {
    return repository.fetchUserActivity(uid);
  }
}
