import 'dart:io';

import 'package:absen_app/activity/domain/usecases/store_file.dart';
import 'package:absen_app/auth/domain/usecases/edit_profile.dart';
import 'package:absen_app/auth/domain/usecases/get_current_user.dart';
import 'package:absen_app/auth/domain/usecases/get_user_data.dart';
import 'package:absen_app/common/constants.dart';
import 'package:absen_app/auth/data/model/user.dart';
import 'package:absen_app/common/key.dart';
import 'package:absen_app/common/snackbar.dart';
import 'package:absen_app/auth/domain/usecases/log_out.dart';
import 'package:absen_app/auth/domain/usecases/register_with_email.dart';
import 'package:absen_app/auth/domain/usecases/sign_in_with_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final SignInWithEmail _signInWithEmail;
  final RegisterWithEmail _registerWithEmail;
  final LogOut _logOut;
  final GetCurrentUser _getCurrentUser;
  final GetUserData _getUserData;
  final EditProfile _editProfile;
  final StoreFile _storeFile;

  AuthNotifier({
    required LogOut logOutUseCase,
    required RegisterWithEmail registerWithEmailUseCase,
    required SignInWithEmail signInWithEmailUseCase,
    required GetCurrentUser getCurrentUserUseCase,
    required GetUserData getUserDataUseCase,
    required EditProfile editProfileUseCase,
    required StoreFile storeFileUseCase,
  })  : _logOut = logOutUseCase,
        _registerWithEmail = registerWithEmailUseCase,
        _signInWithEmail = signInWithEmailUseCase,
        _getCurrentUser = getCurrentUserUseCase,
        _getUserData = getUserDataUseCase,
        _editProfile = editProfileUseCase,
        _storeFile = storeFileUseCase,
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

  void editProfile(
    BuildContext context,
    UserModel user,
    File? file,
    String name,
  ) async {
    state = state.copyWith(state: EnumState.loading);
    if (file != null) {
      final res = await _storeFile.execute('profile', user.uid, file);

      res.fold(
        (l) => snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed(l.message)),
        (r) => user = user.copyWith(profilePic: r),
      );
    }

    user = user.copyWith(name: name);
    final res = await _editProfile.execute(user);

    res.fold(
      (l) => snackbarKey.currentState
          ?.showSnackBar(showSnackBarWithoutContextRed(l.message)),
      (r) {
        getCurrentUser();
        snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed('Profile Update'));
        Routemaster.of(context).pop();
      },
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
