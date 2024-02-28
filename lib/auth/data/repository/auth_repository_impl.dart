import 'package:absen_app/common/exception.dart';
import 'package:absen_app/common/failure.dart';
import 'package:absen_app/auth/data/datasource/auth_remote_datasource.dart';
import 'package:absen_app/auth/data/model/user.dart';
import 'package:absen_app/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRepositoryImpl({
    required AuthRemoteDatasource authRemoteDatasource,
  }) : _authRemoteDatasource = authRemoteDatasource;

  String failureMessage(String exceptionMessage) {
    if (exceptionMessage.contains('wrong-password')) {
      return 'Wrong password';
    } else if (exceptionMessage.contains('invalid-email')) {
      return 'Invalid email';
    } else if (exceptionMessage.contains('user-disabled')) {
      return 'User has been disabled';
    } else if (exceptionMessage.contains('user-not-found')) {
      return 'User not found';
    } else if (exceptionMessage.contains('email-already-in-use')) {
      return 'Email already in use';
    } else if (exceptionMessage.contains('weak-password')) {
      return 'Try different password';
    } else if (exceptionMessage.contains('INVALID_LOGIN_CREDENTIALS')) {
      return 'Email or password is wrong';
    }

    return "Error occured, try again later.";
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      return Right(await _authRemoteDatasource.logOut());
    } on ServerException catch (e) {
      return Left(ServerFailure(failureMessage(e.toString())));
    }
  }

  @override
  Future<Either<Failure, void>> registerWithEmail(
    String email,
    String password,
  ) async {
    try {
      return Right(
          await _authRemoteDatasource.registerWithEmail(email, password));
    } on ServerException catch (e) {
      return Left(ServerFailure(failureMessage(e.toString())));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      return Right(
          await _authRemoteDatasource.signInWithEmail(email, password));
    } on ServerException catch (e) {
      return Left(ServerFailure(failureMessage(e.toString())));
    }
  }

  @override
  Either<Failure, User?> getCurrentUser() {
    try {
      return Right(_authRemoteDatasource.getCurentUser());
    } on ServerException catch (e) {
      return Left(ServerFailure(failureMessage(e.toString())));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserData(String uid) async {
    try {
      return Right(await _authRemoteDatasource.getUserData(uid));
    } on ServerException catch (e) {
      return Left(ServerFailure(failureMessage(e.toString())));
    }
  }

  @override
  Future<Either<Failure, void>> editProfile(UserModel user) async {
    try {
      return Right(await _authRemoteDatasource.editProfile(user));
    } on ServerException catch (e) {
      return Left(ServerFailure(failureMessage(e.toString())));
    }
  }
}
