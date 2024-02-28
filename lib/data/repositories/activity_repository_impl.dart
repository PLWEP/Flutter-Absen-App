import 'dart:io';

import 'package:absen_app/common/exception.dart';
import 'package:absen_app/common/failure.dart';
import 'package:absen_app/data/datasources/activity_remote_datasource.dart';
import 'package:absen_app/data/datasources/activity_storage_datasource.dart';
import 'package:absen_app/data/models/activity.dart';
import 'package:absen_app/domain/repositories/activity_repository.dart';
import 'package:fpdart/fpdart.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final ActivityRemoteDatasource _activityRemoteDatasource;
  final ActivityStorageDatasource _activityStorageDatasource;

  ActivityRepositoryImpl({
    required ActivityRemoteDatasource activityRemoteDatasource,
    required ActivityStorageDatasource activityStorageDatasource,
  })  : _activityRemoteDatasource = activityRemoteDatasource,
        _activityStorageDatasource = activityStorageDatasource;

  @override
  Future<Either<Failure, void>> addActivity(Activity activity) async {
    try {
      return Right(await _activityRemoteDatasource.addActivity(activity));
    } on ServerException {
      return const Left(ServerFailure('Terjadi kesalahan, coba lagi nanti'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteActivity(Activity activity) async {
    try {
      return Right(await _activityRemoteDatasource.deleteActivity(activity));
    } on ServerException {
      return const Left(ServerFailure('Terjadi kesalahan, coba lagi nanti'));
    }
  }

  @override
  Future<Either<Failure, void>> editActivity(Activity activity) async {
    try {
      return Right(await _activityRemoteDatasource.editActivity(activity));
    } on ServerException {
      return const Left(ServerFailure('Terjadi kesalahan, coba lagi nanti'));
    }
  }

  @override
  Either<Failure, Stream<List<Activity>>> fetchUserActivity(String uid) {
    try {
      final result = _activityRemoteDatasource.fetchUserActivity(uid);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('Terjadi kesalahan, coba lagi nanti'));
    }
  }

  @override
  Either<Failure, Stream<Activity>> getActivityById(String activityId) {
    try {
      final result = _activityRemoteDatasource.getActivityById(activityId);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure('Terjadi kesalahan, coba lagi nanti'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteFile(String path, String id) async {
    try {
      return Right(
        await _activityStorageDatasource.deleteFile(
          path: path,
          id: id,
        ),
      );
    } on ServerException {
      return const Left(ServerFailure('Terjadi kesalahan, coba lagi nanti'));
    }
  }

  @override
  Future<Either<Failure, String>> storeFile(
    String path,
    String id,
    File? file,
  ) async {
    try {
      return Right(
        await _activityStorageDatasource.storeFile(
          path: path,
          id: id,
          file: file,
        ),
      );
    } on ServerException {
      return const Left(ServerFailure('Terjadi kesalahan, coba lagi nanti'));
    }
  }
}
