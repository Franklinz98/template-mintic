import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData get darkTheme {
    return ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey[900],
        accentColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey.shade300,
        fontFamily: 'Montserrat',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.blueGrey[900],
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.grey.shade300,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.blueGrey,
            primary: Colors.blueGrey[900],
          ),
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(
              fontSize: 18.0, fontFamily: 'Hind', color: Colors.blueGrey[900]),
        ));
  }
}
