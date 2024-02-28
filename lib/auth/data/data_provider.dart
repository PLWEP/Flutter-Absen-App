import 'package:absen_app/auth/data/datasource/auth_remote_datasource.dart';
import 'package:absen_app/auth/data/repository/auth_repository_impl.dart';
import 'package:absen_app/presentation/providers/firebase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteDataSourceProvider = Provider(
  (ref) => AuthRemoteDatasource(
    auth: ref.watch(authProvider),
    firestore: ref.watch(firestoreProvider),
  ),
);

final authRepositoryProvider = Provider(
  (ref) => AuthRepositoryImpl(
    authRemoteDatasource: ref.watch(authRemoteDataSourceProvider),
  ),
);
