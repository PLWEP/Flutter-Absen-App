import 'package:absen_app/common/exception.dart';
import 'package:absen_app/common/failure.dart';
import 'package:absen_app/data/datasources/activity_remote_datasource.dart';
import 'package:absen_app/data/models/activity.dart';
import 'package:absen_app/domain/repositories/activity_repository.dart';
import 'package:fpdart/fpdart.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final ActivityRemoteDatasource _activityRemoteDatasource;

  ActivityRepositoryImpl({
    required ActivityRemoteDatasource activityRemoteDatasource,
  }) : _activityRemoteDatasource = activityRemoteDatasource;

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
}
