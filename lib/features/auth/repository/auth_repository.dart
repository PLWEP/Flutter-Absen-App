import 'package:absen_app/common/constants.dart';
import 'package:absen_app/common/failure.dart';
import 'package:absen_app/common/type_def.dart';
import 'package:absen_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  AuthRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  })  : _auth = auth,
        _firestore = firestore;

  CollectionReference get _users =>
      _firestore.collection(Constants.usersCollection);

  Stream<User?> get authStateChange => _auth.authStateChanges();

  FutureEither<UserModel> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel userModel;

      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
          name: userCredential.user!.displayName ?? 'Anonim',
          profilePic: userCredential.user!.photoURL ?? Constants.avatarDefault,
          uid: userCredential.user!.uid,
        );
        await _users.doc(userCredential.user!.uid).set(userModel.toMap());
      } else {
        userModel = await getUserData(userCredential.user!.uid).first;
      }

      return right(userModel);
    } on FirebaseException catch (e) {
      return left(Failure(e.message!));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureEither<UserModel> registerWithEmail(
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
        profilePic: userCredential.user!.photoURL ?? Constants.avatarDefault,
      );
      await _users.doc(userCredential.user!.uid).set(userModel.toMap());

      return right(userModel);
    } on FirebaseException catch (e) {
      return left(Failure(e.message!));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<UserModel> getUserData(String uid) => _users
      .doc(uid)
      .snapshots()
      .map((event) => UserModel.fromMap(event.data() as Map<String, dynamic>));

  void logOut() async {
    await _auth.signOut();
  }
}
