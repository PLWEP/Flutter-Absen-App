import 'package:absen_app/auth/domain/usecases/get_current_user.dart';
import 'package:absen_app/auth/domain/usecases/get_user_data.dart';
import 'package:absen_app/common/constants.dart';
import 'package:absen_app/auth/data/model/user.dart';
import 'package:absen_app/common/key.dart';
import 'package:absen_app/common/snackbar.dart';
import 'package:absen_app/auth/domain/usecases/log_out.dart';
import 'package:absen_app/auth/domain/usecases/register_with_email.dart';
import 'package:absen_app/auth/domain/usecases/sign_in_with_email.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final SignInWithEmail _signInWithEmail;
  final RegisterWithEmail _registerWithEmail;
  final LogOut _logOut;
  final GetCurrentUser _getCurrentUser;
  final GetUserData _getUserData;

  AuthNotifier({
    required LogOut logOutUseCase,
    required RegisterWithEmail registerWithEmailUseCase,
    required SignInWithEmail signInWithEmailUseCase,
    required GetCurrentUser getCurrentUserUseCase,
    required GetUserData getUserDataUseCase,
  })  : _logOut = logOutUseCase,
        _registerWithEmail = registerWithEmailUseCase,
        _signInWithEmail = signInWithEmailUseCase,
        _getCurrentUser = getCurrentUserUseCase,
        _getUserData = getUserDataUseCase,
        super(const AuthState.initial()) {
    getCurrentUser();
  }

  void getCurrentUser() {
    state = state.copyWith(state: EnumState.loading);
    final user = _getCurrentUser.execute();
    user.fold(
      (l) {
        state = state.copyWith(state: EnumState.failure, message: l.message);
        snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
      },
      (r) async {
        if (r == null) {
          state = const AuthState.initial();
        } else {
          final userData = await _getUserData.execute(r.uid);

          userData.fold(
            (l) {
              state =
                  state.copyWith(state: EnumState.failure, message: l.message);
              snackbarKey.currentState
                  ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
            },
            (r) => state = state.copyWith(state: EnumState.loaded, userData: r),
          );
        }
      },
    );
  }

  void signInWithEmail(
    String email,
    String password,
  ) async {
    state = state.copyWith(state: EnumState.loading);
    final user = await _signInWithEmail.execute(email, password);
    user.fold(
      (l) {
        state = state.copyWith(state: EnumState.failure, message: l.message);
        snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
      },
      (r) => getCurrentUser(),
    );
  }

  void registerWithEmail(
    String email,
    String password,
  ) async {
    state = state.copyWith(state: EnumState.loading);
    final user = await _registerWithEmail.execute(email, password);

    user.fold(
      (l) {
        state = state.copyWith(state: EnumState.failure, message: l.message);
        snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
      },
      (r) => getCurrentUser(),
    );
  }

  void logout() async {
    state = state.copyWith(state: EnumState.loading);
    final res = await _logOut.execute();

    res.fold(
      (l) {
        state = state.copyWith(state: EnumState.failure, message: l.message);
        snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
      },
      (r) => getCurrentUser(),
    );
  }
}

class AuthState {
  final UserModel? userData;
  final EnumState state;
  final String message;

  const AuthState({
    this.userData,
    this.state = EnumState.initial,
    this.message = '',
  });

  const AuthState.initial({
    this.userData,
    this.state = EnumState.initial,
    this.message = '',
  });

  AuthState copyWith({
    UserModel? userData,
    EnumState? state,
    String? message,
  }) {
    return AuthState(
      userData: userData ?? this.userData,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }
}
