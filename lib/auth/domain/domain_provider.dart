import 'package:absen_app/auth/data/data_provider.dart';
import 'package:absen_app/auth/domain/usecases/register_with_email.dart';
import 'package:absen_app/auth/domain/usecases/sign_in_with_email.dart';
import 'package:absen_app/domain/usecases/log_out.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final logOutProvider = Provider(
  (ref) => LogOut(ref.watch(authRepositoryProvider)),
);

final registerWithEmailProvider = Provider(
  (ref) => RegisterWithEmail(ref.watch(authRepositoryProvider)),
);

final signInWithEmailProvider = Provider(
  (ref) => SignInWithEmail(ref.watch(authRepositoryProvider)),
);
