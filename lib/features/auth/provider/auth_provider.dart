import 'package:absen_app/common/firebase_provider.dart';
import 'package:absen_app/features/auth/controller/auth_controller.dart';
import 'package:absen_app/features/auth/repository/auth_repository.dart';
import 'package:absen_app/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(
    authRepository: ref.watch(authRepositoryProvider),
    ref: ref,
  ),
);

final authStateChangeProvider = StreamProvider(
  (ref) {
    final authController = ref.watch((authControllerProvider.notifier));
    return authController.authStateChange;
  },
);

final getUserDataProvider = StreamProvider.family(
  (ref, String uid) {
    final authController = ref.watch((authControllerProvider.notifier));
    return authController.getUserData(uid);
  },
);

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
  ),
);
