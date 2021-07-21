import 'package:red_egresados/data/repositories/google_auth.dart';
import 'package:red_egresados/data/repositories/password_auth.dart';

class AuthManagement {
  static final PasswordAuth _auth = PasswordAuth();

  static Future<void> signIn(
      {required String email, required String password}) async {
    try {
      await _auth.signIn(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> signInWithGoogle() async {
    try {
      await GoogleAuth().signInWithGoogle();
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await _auth.signUp(name: name, email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
