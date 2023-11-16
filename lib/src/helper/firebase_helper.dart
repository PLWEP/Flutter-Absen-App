import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  Future<String> register(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return "success";
    } catch (error) {
      if (error is FirebaseAuthException) {
        return error.code;
      } else {
        return "An error occurred";
      }
    }
  }
}
