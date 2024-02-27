import 'package:absen_app/common/failure.dart';
import 'package:absen_app/data/models/activity.dart';
import 'package:absen_app/domain/repositories/activity_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteActivity {
  final ActivityRepository repository;

  DeleteActivity(this.repository);

  Future<Either<Failure, void>> execute(Activity activity) {
    return repository.deleteActivity(activity);
  }
}
