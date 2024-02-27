import 'package:absen_app/common/failure.dart';
import 'package:absen_app/data/models/user.dart';
import 'package:absen_app/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetUserData {
  final AuthRepository repository;

  GetUserData(this.repository);

  Either<Failure, Stream<UserModel>> execute(String uid) {
    return repository.getUserData(uid);
  }
}
