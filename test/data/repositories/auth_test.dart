import 'package:flutter_test/flutter_test.dart';
import 'package:red_egresados/data/repositories/auth.dart';

void main() {
  Auth? auth;

  // When test starts get a new instance of Auth
  setUp(() {
    auth = Auth();
  });

  // When test ends remove used instance
  tearDown(() {
    auth = null;
  });

  // Contrast method result with expected value
  test(
    "SignIn valid",
    () async {
      expect(
          await auth!.signIn(
              email: "barry.allen@example.com",
              password: "SuperSecretPassword!"),
          true);
    },
  );

  test(
    "SignIn invalid",
    () async {
      expect(await auth!.signIn(email: "user@test.com", password: "123456"),
          false);
    },
  );

  test(
    "SignUp valid",
    () async {
      expect(
          await auth!.signUp(
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
          await auth!
              .signUp(name: "User", email: "usertest.xys", password: "1456"),
          false);
    },
  );

  test(
    "SignOut validation",
    () async {
      expect(await auth!.signOut(), true);
    },
  );
}
