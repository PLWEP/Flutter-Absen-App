import 'package:absen_app/common/failure.dart';
import 'package:absen_app/activity/data/model/activity.dart';
import 'package:absen_app/activity/domain/repository/activity_repository.dart';
import 'package:fpdart/fpdart.dart';

class EditActivity {
  final ActivityRepository repository;

  EditActivity(this.repository);

  Future<Either<Failure, void>> execute(Activity activity) {
    return repository.editActivity(activity);
  }
}
