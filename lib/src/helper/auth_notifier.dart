import 'package:absen_app/src/helper/firebase_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider((ref) => AuthNotifier());

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier() : super(null);
  final FirebaseHelper _firebaseHelper = FirebaseHelper();

  Future<void> register(String email, String password) async {
    final result = await _firebaseHelper.register(email, password);
    if (result == "success") {
      final user = FirebaseAuth.instance.currentUser;
      state = user;
    } else {
      state = null;
    }
  }

  Future<void> login(String email, String password) async {
    final result = await _firebaseHelper.login(email, password);
    if (result == "success") {
      final user = FirebaseAuth.instance.currentUser;
      state = user;
    } else {
      state = null;
    }
  }
}
