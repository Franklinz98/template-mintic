import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:red_egresados/domain/use_case/controller.dart';
import 'package:red_egresados/presentation/pages/authentication/index.dart';
import 'package:red_egresados/presentation/pages/content/index.dart';

void main() {
  late Controller controller;

  setUp(() {
    controller = Controller();
    Get.put(controller);
    ever(controller.currentUser, (bool user) {
      if (user) {
        Get.off(() => ContentPage());
      } else {
        Get.off(() => Authentication());
      }
    });
  });

  // When test ends remove used instance
  tearDown(() {});

  testWidgets("signUp", (WidgetTester tester) async {
    // Widgets Testing requires that the widgets we need to test have a unique key
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

    // We expect to find the appBar widget that is present in content
    // page, that means that the authentication was successful
    expect(find.byKey(ValueKey("pageTitle")), findsOneWidget);
  });

  testWidgets("signOut", (WidgetTester tester) async {
    final signOutButton = find.byKey(ValueKey("signOutAction"));

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(GetMaterialApp(home: ContentPage()));
      await tester.tap(signOutButton);
      await tester.pumpAndSettle();
    });

    // We expect to find the text 'Iniciar sesión' that is present in authentication
    // page, that means that the logout was successful
    expect(find.text("Iniciar sesión"), findsOneWidget);
  });

  testWidgets("signIn", (WidgetTester tester) async {
    // Widgets Testing requires that the widgets we need to test have a unique key
    final loginScroll = find.byKey(ValueKey("loginScroll"));
    final emailField = find.byKey(ValueKey("signInEmail"));
    final passwordField = find.byKey(ValueKey("signInPassword"));
    final actionButton = find.byKey(ValueKey("signInButton"));

    await mockNetworkImagesFor(() async {
      // We begin the rendering of the main widgets
      await tester.pumpWidget(GetMaterialApp(home: Authentication()));
      await tester.drag(loginScroll, const Offset(0.0, -100));
      // After trigger a drag action we wait for it to end
      await tester.pump();
      await tester.enterText(emailField, "barry.allen@example.com");
      await tester.enterText(passwordField, "SuperSecretPassword!");
      await tester.tap(actionButton);
      // After entering needed text and tap on the button we wait
      // that all animations end
      await tester.pumpAndSettle();
    });

    // We expect to find the appBar widget that is present in content
    // page, that means that the authentication was successful
    expect(find.byKey(ValueKey("pageTitle")), findsOneWidget);
  });
}
