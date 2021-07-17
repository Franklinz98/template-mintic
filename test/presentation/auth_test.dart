import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:red_egresados/presentation/pages/authentication/index.dart';
import 'package:red_egresados/presentation/pages/content/index.dart';

void main() {
  testWidgets("signIn", (WidgetTester tester) async {
    final loginScroll = find.byKey(ValueKey("loginScroll"));
    final emailField = find.byKey(ValueKey("signInEmail"));
    final passwordField = find.byKey(ValueKey("signInPassword"));
    final actionButton = find.byKey(ValueKey("signInButton"));

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(GetMaterialApp(home: Authentication()));
      await tester.drag(loginScroll, const Offset(0.0, -100));
      await tester.pump();
      await tester.enterText(emailField, "barry.allen@example.com");
      await tester.enterText(passwordField, "SuperSecretPassword!");
      await tester.tap(actionButton);
      await tester.pumpAndSettle();
    });

    expect(find.text("TITLE"), findsOneWidget);
  });

  testWidgets("signUp", (WidgetTester tester) async {
    final loginScroll = find.byKey(ValueKey('loginScroll'));
    final signupScroll = find.byKey(ValueKey('signupScroll'));
    final nameField = find.byKey(ValueKey("signUpName"));
    final emailField = find.byKey(ValueKey("signUpEmail"));
    final passwordField = find.byKey(ValueKey("signUpPassword"));
    final actionButton = find.byKey(ValueKey("signUpButton"));
    final switchTo = find.byKey(ValueKey("toSignUpButton"));

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(GetMaterialApp(home: Authentication()));
      await tester.drag(loginScroll, const Offset(0.0, -100));
      await tester.pump();
      await tester.tap(switchTo);
      await tester.pumpAndSettle();
      await tester.drag(signupScroll, const Offset(0.0, -200));
      await tester.pump();
      await tester.enterText(nameField, "User");
      await tester.enterText(emailField, "barry.allen@example.com");
      await tester.enterText(passwordField, "SuperSecretPassword!");
      await tester.tap(actionButton);
      await tester.pumpAndSettle();
    });

    expect(find.text("TITLE"), findsOneWidget);
  });

  testWidgets("signOut", (WidgetTester tester) async {
    final signOutButton = find.byKey(ValueKey("signOutAction"));

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(GetMaterialApp(home: ContentPage()));
      await tester.tap(signOutButton);
      await tester.pumpAndSettle();
    });

    expect(find.text("Iniciar sesión"), findsOneWidget);
  });
}
