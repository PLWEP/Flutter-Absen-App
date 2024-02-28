import 'package:absen_app/common/failure.dart';
import 'package:absen_app/activity/domain/repository/activity_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteFile {
  final ActivityRepository repository;

  DeleteFile(this.repository);

  Future<Either<Failure, void>> execute(String path, String id) {
    return repository.deleteFile(path, id);
  }
}
