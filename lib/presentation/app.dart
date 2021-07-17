import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/authentication/index.dart';
import 'theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.ligthTheme,
        darkTheme: MyTheme.darkTheme,
        home: Authentication());
  }
}
