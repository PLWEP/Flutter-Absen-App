import 'dart:io';

import 'package:absen_app/common/failure.dart';
import 'package:absen_app/domain/repositories/activity_repository.dart';
import 'package:fpdart/fpdart.dart';

class StoreFile {
  final ActivityRepository repository;

  StoreFile(this.repository);

  Future<Either<Failure, String>> execute(String path, String id, File? file) {
    return repository.storeFile(path, id, file);
  }
}
