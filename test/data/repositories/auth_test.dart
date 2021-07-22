import 'package:flutter_test/flutter_test.dart';
import 'mock_google_auth.dart';
import 'mock_password_auth.dart';

void main() {
  late MockPasswordAuth auth;
  late MockGoogleAuth googleAuth;

  // When test starts get a new instance of Auth
  setUp(() {
    auth = MockPasswordAuth();
    googleAuth = MockGoogleAuth();
  });

  // When test ends remove used instance
  tearDown(() {});

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
    "Google SignIn invalid",
    () async {
      expect(await googleAuth.signInWithGoogle(), true);
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
              name: "User", email: "usertest.xys", password: "1456"),
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
