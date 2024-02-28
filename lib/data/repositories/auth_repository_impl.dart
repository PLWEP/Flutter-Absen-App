import 'package:absen_app/common/exception.dart';
import 'package:absen_app/common/failure.dart';
import 'package:absen_app/data/datasources/auth_remote_datasource.dart';
import 'package:absen_app/data/models/user.dart';
import 'package:absen_app/domain/repositories/auth_repository.dart';
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
  Future<Either<Failure, UserModel>> registerWithEmail(
    String email,
    String password,
  ) async {
    try {
      final result =
          await _authRemoteDatasource.registerWithEmail(email, password);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('Terjadi kesalahan, coba lagi nanti'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      final result =
          await _authRemoteDatasource.signInWithEmail(email, password);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('Terjadi kesalahan, coba lagi nanti'));
    }
  }
}
