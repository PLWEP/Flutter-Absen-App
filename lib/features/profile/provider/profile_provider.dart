import 'package:absen_app/presentation/providers/firebase_provider.dart';
import 'package:absen_app/common/repository/storage_repository.dart';
import 'package:absen_app/features/profile/controller/profile_controller.dart';
import 'package:absen_app/features/profile/repository/profile_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRepositoryProvider = Provider(
  (ref) => ProfileRepository(
    firestore: ref.watch(firestoreProvider),
  ),
);

final profileControllerProvider =
    StateNotifierProvider<ProfileController, bool>(
  (ref) {
    final profileRepository = ref.watch(profileRepositoryProvider);
    final storageRepository = ref.watch(storageRepositoryProvider);
    return ProfileController(
      ref: ref,
      profileRepository: profileRepository,
      storageRepository: storageRepository,
    );
  },
);
