import 'package:flutter_test/flutter_test.dart';
import 'package:red_egresados/domain/use_case/auth_management.dart';

import '../../data/repositories/mock_google_auth.dart';
import '../../data/repositories/mock_password_auth.dart';

void main() {
  late MockPasswordAuth passwordAuth;
  late MockGoogleAuth googleAuth;
  late AuthManagement auth;

  setUp(() {
    passwordAuth = MockPasswordAuth();
    googleAuth = MockGoogleAuth();
    auth = AuthManagement(auth: passwordAuth, googleAuth: googleAuth);
  });
  tearDown(() {});
  // AuthManagement uses Auth for management
  // Contrast method result with expected value
  test(
    "SignIn valid",
    () async {
      expect(
          await auth.signIn(
              email: "barry.allen@example.com",
              password: "SuperSecretPassword!"),
          true);
    },
  );

  test(
    "SignIn invalid",
    () async {
      expect(
          await auth.signIn(email: "user@test.com", password: "123456"), false);
    },
  );

  test(
    "SignUp valid",
    () async {
      expect(
          await auth.signUp(
              name: "User",
              email: "barry.allen@example.com",
              password: "SuperSecretPassword!"),
          true);
    },
  );

  test(
    "SignUp invalid",
    () async {
      expect(
          await auth.signUp(
            name: "User",
            email: "usertest.xys",
            password: "1456",
          ),
          false);
    },
  );

  test(
    "SignOut validation",
    () async {
      expect(await auth.signOut(), true);
    },
  );
}
