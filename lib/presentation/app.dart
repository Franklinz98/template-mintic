import 'package:flutter/material.dart';

import 'pages/content/index.dart';
import 'theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.ligthTheme,
        darkTheme: MyTheme.darkTheme,
        home: ContentPage());
  }
}