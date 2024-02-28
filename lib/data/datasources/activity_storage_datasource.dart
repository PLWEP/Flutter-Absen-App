import 'dart:io';

import 'package:absen_app/common/exception.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ActivityStorageDatasource {
  final FirebaseStorage _firebaseStorage;
  ActivityStorageDatasource({
    required FirebaseStorage storage,
  }) : _firebaseStorage = storage;

  Future<String> storeFile({
    required String path,
    required String id,
    required File? file,
  }) async {
    try {
      UploadTask uploadTask =
          _firebaseStorage.ref().child(path).child(id).putFile(file!);
      final snapshot = await uploadTask;

      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      throw ServerException();
    }
  }

  Future<void> deleteFile({
    required String path,
    required String id,
  }) async {
    try {
      return await _firebaseStorage.ref().child(path).child(id).delete();
    } catch (e) {
      throw ServerException();
    }
  }
}
