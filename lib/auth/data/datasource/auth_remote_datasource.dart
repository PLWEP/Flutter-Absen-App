import 'package:absen_app/common/constants.dart';
import 'package:absen_app/common/exception.dart';
import 'package:absen_app/auth/data/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDatasource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  AuthRemoteDatasource({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  })  : _auth = auth,
        _firestore = firestore;

  CollectionReference get _users =>
      _firestore.collection(Constants.usersCollection);

  Future<UserModel> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel = await getUserData(userCredential.user!.uid).first;

      return userModel;
    } catch (e) {
      throw ServerException();
    }
  }

  Stream<UserModel> getUserData(String uid) {
    try {
      return _users.doc(uid).snapshots().map(
            (event) => UserModel.fromJson(event.data() as Map<String, dynamic>),
          );
    } catch (e) {
      throw ServerException();
    }
  }

  Future<UserModel> registerWithEmail(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel = UserModel(
        uid: userCredential.user!.uid,
        name: userCredential.user!.displayName ??
            'User${userCredential.user!.uid}',
        profilePic: userCredential.user!.photoURL ?? '',
      );
      await _users.doc(userCredential.user!.uid).set(userModel.toJson());

      return userModel;
    } catch (e) {
      throw ServerException();
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw ServerException();
    }
  }
}
