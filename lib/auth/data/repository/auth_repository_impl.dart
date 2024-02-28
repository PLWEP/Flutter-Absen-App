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

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      return Right(await _authRemoteDatasource.logOut());
    } on ServerException {
      return const Left(ServerFailure('Terjadi kesalahan, coba lagi nanti'));
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
    } on ServerException {
      return const Left(ServerFailure('Terjadi kesalahan, coba lagi nanti'));
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
    } on ServerException {
      return const Left(ServerFailure('Terjadi kesalahan, coba lagi nanti'));
    }
  }

  @override
  Either<Failure, User?> getCurrentUser() {
    try {
      return Right(_authRemoteDatasource.getCurentUser());
    } on ServerException {
      return const Left(ServerFailure('Terjadi kesalahan, coba lagi nanti'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUserData(String uid) async {
    try {
      return Right(await _authRemoteDatasource.getUserData(uid));
    } on ServerException {
      return const Left(ServerFailure('Terjadi kesalahan, coba lagi nanti'));
    }
  }
}
