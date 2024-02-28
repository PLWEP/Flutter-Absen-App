import 'package:absen_app/common/failure.dart';
import 'package:absen_app/auth/data/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Either<Failure, User?> getCurrentUser();
  Future<Either<Failure, UserModel>> getUserData(String uid);
  Future<Either<Failure, void>> signInWithEmail(String email, String password);
  Future<Either<Failure, void>> registerWithEmail(
      String email, String password);
  Future<Either<Failure, void>> logOut();
}
