import 'package:absen_app/common/failure.dart';
import 'package:absen_app/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class GetCurrentUser {
  final AuthRepository repository;

  GetCurrentUser(this.repository);

  Either<Failure, User?> execute() => repository.getCurrentUser();
}
