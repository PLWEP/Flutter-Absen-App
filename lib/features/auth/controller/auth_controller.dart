import 'package:absen_app/features/auth/provider/auth_provider.dart';
import 'package:absen_app/features/auth/repository/auth_repository.dart';
import 'package:absen_app/data/model/user_model.dart';
import 'package:absen_app/common/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;
  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false);

  Stream<User?> get authStateChange => _authRepository.authStateChange;

  void signInWithEmail(
    BuildContext context,
    String email,
    String password,
  ) async {
    state = true;
    final user = await _authRepository.signInWithEmail(email, password);
    state = false;
    user.fold(
      (l) => showSnackBar(context, l.message),
      (userModel) =>
          _ref.read(userProvider.notifier).update((state) => userModel),
    );
  }

  void registerWithEmail(
    BuildContext context,
    String email,
    String password,
  ) async {
    state = true;
    final user = await _authRepository.registerWithEmail(email, password);
    state = false;
    user.fold(
      (l) => showSnackBar(context, l.message),
      (userModel) =>
          _ref.read(userProvider.notifier).update((state) => userModel),
    );
  }

  Stream<UserModel> getUserData(String uid) => _authRepository.getUserData(uid);

  void logout() => _authRepository.logOut();
}
