import 'dart:io';

import 'package:absen_app/common/failure.dart';
import 'package:absen_app/common/firebase_provider.dart';
import 'package:absen_app/common/type_def.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final storageRepositoryProvider = Provider(
  (ref) => StorageRepositorty(
    firebaseStorage: ref.watch(storageProvider),
  ),
);

class StorageRepositorty {
  final FirebaseStorage _firebaseStorage;

  StorageRepositorty({required FirebaseStorage firebaseStorage})
      : _firebaseStorage = firebaseStorage;

  FutureEither<String> storeFile({
    required String path,
    required String id,
    required File? file,
  }) async {
    try {
      final ref = _firebaseStorage.ref().child(path).child(id);

      UploadTask uploadTask = ref.putFile(file!);
      final snapshot = await uploadTask;

      return right(await snapshot.ref.getDownloadURL());
    } on FirebaseException catch (e) {
      return left(Failure(e.message!));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid deleteFile({
    required String path,
    required String id,
  }) async {
    try {
      final ref = _firebaseStorage.ref().child(path).child(id);

      return right(await ref.delete());
    } on FirebaseException catch (e) {
      return left(Failure(e.message!));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
