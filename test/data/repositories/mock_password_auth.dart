import 'package:mockito/mockito.dart';
import 'package:red_egresados/data/repositories/password_auth.dart';

class MockPasswordAuth extends Mock implements PasswordAuth {
  @override
  Future<bool> signIn({required String email, required String password}) async {
    final emailVal = "barry.allen@example.com" == email;
    final passwordVal = "SuperSecretPassword!" == password;
    return emailVal && passwordVal;
  }

  @override
  Future<bool> signOut() async {
    return true;
  }

  @override
  Future<bool> signUp(
      {required String name,
      required String email,
      required String password}) async {
    final emailVal = email.contains("@") && email.contains(".co");
    final passwordVal = password.length > 6;
    return emailVal && passwordVal;
  }
}