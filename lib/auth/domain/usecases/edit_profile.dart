import 'package:absen_app/auth/data/model/user.dart';
import 'package:absen_app/common/failure.dart';
import 'package:absen_app/auth/domain/repository/auth_repository.dart';

import 'package:fpdart/fpdart.dart';

class EditProfile {
  final AuthRepository repository;

  EditProfile(this.repository);

  Future<Either<Failure, void>> execute(UserModel userModel) =>
      repository.editProfile(userModel);
}
