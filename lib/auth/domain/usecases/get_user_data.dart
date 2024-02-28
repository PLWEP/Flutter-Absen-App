import 'package:absen_app/auth/data/model/user.dart';
import 'package:absen_app/common/failure.dart';
import 'package:absen_app/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetUserData {
  final AuthRepository repository;

  GetUserData(this.repository);

  Future<Either<Failure, UserModel>> execute(String uid) =>
      repository.getUserData(uid);
}
