import 'package:absen_app/common/key.dart';
import 'package:absen_app/data/datasources/auth_remote_datasource.dart';
import 'package:absen_app/data/models/user.dart';
import 'package:absen_app/common/utils.dart';
import 'package:absen_app/data/repositories/auth_repository_impl.dart';
import 'package:absen_app/domain/usecases/log_out.dart';
import 'package:absen_app/domain/usecases/register_with_email.dart';
import 'package:absen_app/domain/usecases/sign_in_with_email.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:absen_app/presentation/providers/firebase_provider.dart';

class AuthController extends StateNotifier<bool> {
  final SignInWithEmail _signInWithEmail;
  final RegisterWithEmail _registerWithEmail;
  final LogOut _logOut;
  final Ref _ref;
  AuthController({
    required Ref ref,
    required LogOut logOut,
    required RegisterWithEmail registerWithEmail,
    required SignInWithEmail signInWithEmail,
  })  : _ref = ref,
        _logOut = logOut,
        _registerWithEmail = registerWithEmail,
        _signInWithEmail = signInWithEmail,
        super(false);

  void signInWithEmail(
    String email,
    String password,
  ) async {
    state = true;
    final user = await _signInWithEmail.execute(email, password);
    state = false;
    user.fold(
      (l) => snackbarKey.currentState
          ?.showSnackBar(showSnackBarWithoutContext(l.message)),
      (r) => _ref.read(userProvider.notifier).update((state) => r),
    );
  }

  void registerWithEmail(
    String email,
    String password,
  ) async {
    state = true;
    final user = await _registerWithEmail.execute(email, password);
    state = false;
    user.fold(
      (l) => snackbarKey.currentState
          ?.showSnackBar(showSnackBarWithoutContext(l.message)),
      (r) => _ref.read(userProvider.notifier).update((state) => r),
    );
  }

  void logout() async {
    state = true;
    final res = await _logOut.execute();
    state = false;
    res.fold(
      (l) => snackbarKey.currentState
          ?.showSnackBar(showSnackBarWithoutContext(l.message)),
      (r) {
        _ref.read(userProvider.notifier).update((state) => null);
        snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContext('Log Out'));
      },
    );
  }
}

final userProvider = StateProvider<UserModel?>((ref) => null);

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

final logOutProvider = Provider(
  (ref) => LogOut(ref.watch(authRepositoryProvider)),
);

final registerWithEmailProvider = Provider(
  (ref) => RegisterWithEmail(ref.watch(authRepositoryProvider)),
);

final signInWithEmailProvider = Provider(
  (ref) => SignInWithEmail(ref.watch(authRepositoryProvider)),
);

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) {
    return AuthController(
      logOut: ref.watch(logOutProvider),
      signInWithEmail: ref.watch(signInWithEmailProvider),
      registerWithEmail: ref.watch(registerWithEmailProvider),
      ref: ref,
    );
  },
);
