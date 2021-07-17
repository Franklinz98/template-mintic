import 'package:flutter_test/flutter_test.dart';
import 'package:red_egresados/data/repositories/auth.dart';

void main() {
  Auth? auth;

  setUp(() {
    auth = Auth();
  });
  tearDown(() {
    auth = null;
  });
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
