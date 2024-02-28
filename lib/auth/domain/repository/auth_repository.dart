import 'package:absen_app/common/failure.dart';
import 'package:absen_app/auth/data/model/user.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> signInWithEmail(
    String email,
    String password,
  );
  Future<Either<Failure, UserModel>> registerWithEmail(
    String email,
    String password,
  );
  Future<Either<Failure, void>> logOut();
}