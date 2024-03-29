import 'package:absen_app/common/failure.dart';
import 'package:absen_app/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class LogOut {
  final AuthRepository repository;

  LogOut(this.repository);

  Future<Either<Failure, void>> execute() {
    return repository.logOut();
  }
}
