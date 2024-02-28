import 'package:absen_app/auth/data/data_provider.dart';
import 'package:absen_app/auth/domain/usecases/get_current_user.dart';
import 'package:absen_app/auth/domain/usecases/get_user_data.dart';
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

final getCurrentUserProvider = Provider(
  (ref) => GetCurrentUser(ref.watch(authRepositoryProvider)),
);

final getUserDataProvider = Provider(
  (ref) => GetUserData(ref.watch(authRepositoryProvider)),
);
