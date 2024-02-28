import 'package:absen_app/activity/domain/domain_provider.dart';
import 'package:absen_app/auth/domain/domain_provider.dart';
import 'package:absen_app/auth/presentation/notifier/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    return AuthNotifier(
      logOutUseCase: ref.watch(logOutProvider),
      signInWithEmailUseCase: ref.watch(signInWithEmailProvider),
      registerWithEmailUseCase: ref.watch(registerWithEmailProvider),
      getCurrentUserUseCase: ref.watch(getCurrentUserProvider),
      getUserDataUseCase: ref.watch(getUserDataProvider),
      editProfileUseCase: ref.watch(editProfileProvider),
      storeFileUseCase: ref.watch(storeFileProvider),
    );
  },
);
