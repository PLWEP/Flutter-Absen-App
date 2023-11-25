import 'dart:io';

import 'package:absen_app/common/repository/storage_repository.dart';
import 'package:absen_app/features/auth/provider/auth_provider.dart';
import 'package:absen_app/features/profile/repository/profile_repository.dart';
import 'package:absen_app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:absen_app/common/utils.dart';
import 'package:routemaster/routemaster.dart';

class ProfileController extends StateNotifier<bool> {
  final ProfileRepository _profileRepository;
  final Ref _ref;
  final StorageRepositorty _storageRepository;

  ProfileController(
      {required ProfileRepository profileRepository,
      required Ref ref,
      required StorageRepositorty storageRepository})
      : _profileRepository = profileRepository,
        _storageRepository = storageRepository,
        _ref = ref,
        super(false);

  void editProfile({
    required File? file,
    required BuildContext context,
    required String name,
  }) async {
    UserModel user = _ref.read(userProvider)!;
    state = true;
    if (file != null) {
      final res = await _storageRepository.storeFile(
        path: 'profile',
        id: user.uid,
        file: file,
      );

      res.fold(
        (l) => showSnackBar(context, l.message),
        (r) => user = user.copyWith(profilePic: r),
      );
    }

    user = user.copyWith(name: name);
    final res = await _profileRepository.editProfile(user);
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        _ref.read(userProvider.notifier).update((state) => user);
        Routemaster.of(context).pop();
      },
    );
  }
}
