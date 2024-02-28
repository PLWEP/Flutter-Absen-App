// import 'package:absen_app/common/constants.dart';
// import 'package:absen_app/common/failure.dart';
// import 'package:absen_app/common/type_def.dart';
// import 'package:absen_app/data/model/user_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fpdart/fpdart.dart';

// class ProfileRepository {
//   final FirebaseFirestore _firestore;

//   ProfileRepository({required FirebaseFirestore firestore})
//       : _firestore = firestore;

//   CollectionReference get _users =>
//       _firestore.collection(Constants.usersCollection);

//   FutureVoid editProfile(UserModel user) async {
//     try {
//       return right(_users.doc(user.uid).update(user.toMap()));
//     } on FirebaseException catch (e) {
//       return left(Failure(e.message!));
//     } catch (e) {
//       return left(Failure(e.toString()));
//     }
//   }
// }
