import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:red_egresados/domain/repositories/auth.dart';

class PasswordAuth implements AuthInterface {
  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Usuario no encontrado",
          "No se encontró un usuario que use ese email.",
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Contraseña equivocada",
          "La contraseña proveida por el usuario no es correcta.",
        );
      }
    }
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userCredential) =>
              {userCredential.user!.updateDisplayName(name)});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          "Contraseña insegura",
          "La seguridad de la contraseña es muy débil",
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "Email inválido",
          "Ya existe un usuario con este correo electrónico.",
        );
      }
    } catch (e) {
      print(e);
    }
  }

  // We throw an error if someone calls SignInWithGoogle, member of AuthInterface
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
