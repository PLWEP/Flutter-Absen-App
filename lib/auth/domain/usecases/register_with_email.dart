import 'package:absen_app/common/failure.dart';
import 'package:absen_app/auth/data/model/user.dart';
import 'package:absen_app/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class RegisterWithEmail {
  final AuthRepository repository;

  RegisterWithEmail(this.repository);

  Future<Either<Failure, UserModel>> execute(
    String email,
    String password,
  ) {
    return repository.registerWithEmail(email, password);
  }
}
