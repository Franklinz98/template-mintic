import 'package:flutter/material.dart';

import 'pages/content/home_page.dart';
import 'theme/theme.dart';

class Base extends StatelessWidget {
  const Base({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.darkTheme,
        //home: Scaffold(),
        home: HomePage());
  }
}
