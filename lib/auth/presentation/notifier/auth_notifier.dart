import 'package:absen_app/common/key.dart';
import 'package:absen_app/auth/data/model/user.dart';
import 'package:absen_app/common/utils.dart';
import 'package:absen_app/domain/usecases/log_out.dart';
import 'package:absen_app/auth/domain/usecases/register_with_email.dart';
import 'package:absen_app/auth/domain/usecases/sign_in_with_email.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<bool> {
  final SignInWithEmail _signInWithEmail;
  final RegisterWithEmail _registerWithEmail;
  final LogOut _logOut;
  final Ref _ref;
  AuthNotifier({
    required Ref ref,
    required LogOut logOutUseCase,
    required RegisterWithEmail registerWithEmailUseCase,
    required SignInWithEmail signInWithEmailUseCase,
  })  : _ref = ref,
        _logOut = logOutUseCase,
        _registerWithEmail = registerWithEmailUseCase,
        _signInWithEmail = signInWithEmailUseCase,
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
