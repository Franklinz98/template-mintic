import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthInterface {
  Future<void> signUp(
      {required String name, required String email, required String password});

  Future<void> signIn({required String email, required String password});

  Future<void> signInWithGoogle();

  Future<void> signOut();

  static Stream<User?> get authStream =>
      FirebaseAuth.instance.authStateChanges();
}
