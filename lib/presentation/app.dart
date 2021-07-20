import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:red_egresados/domain/repositories/auth.dart';
import 'package:red_egresados/domain/use_case/controller.dart';
import 'package:red_egresados/presentation/pages/authentication/index.dart';
import 'package:red_egresados/presentation/pages/content/index.dart';

import 'theme/theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Dependency injection: setting up state management
  final Controller controller = Get.put(Controller());

  // Firebase initialization vars
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        // Listering for auth state changes
        AuthInterface.authStream.listen(
          (User? user) => controller.updateUser(user),
        );
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    // State management: listening for changes on currentUser
    ever(controller.currentUser, (User? user) {
      // Using Get.off so we can't go back when auth changes
      // This navigation triggers automatically when auth state changes on the app state
      if (user != null && _initialized) {
        Get.off(() => ContentPage());
      } else {
        Get.off(() => Authentication());
      }
    });
    // Trigger Firebase initialization
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return MaterialApp(
        theme: MyTheme.ligthTheme,
        darkTheme: MyTheme.darkTheme,
        home: Center(
          child: Text("Hubo un error con Firebase"),
        ),
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return MaterialApp(
        theme: MyTheme.ligthTheme,
        darkTheme: MyTheme.darkTheme,
        home: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return GetMaterialApp(
      theme: MyTheme.ligthTheme,
      darkTheme: MyTheme.darkTheme,
      home: Authentication(),
    );
  }
}
