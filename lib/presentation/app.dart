import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  void initState() {
    // State management: listening for changes on currentUser
    ever(controller.currentUser, (bool user) {
      // Using Get.off so we can't go back when auth changes
      // This navigation triggers automatically when auth state changes on the app state
      if (user) {
        Get.off(() => ContentPage());
      } else {
        Get.off(() => Authentication());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: MyTheme.ligthTheme,
      darkTheme: MyTheme.darkTheme,
      home: Authentication(),
    );
  }
}
