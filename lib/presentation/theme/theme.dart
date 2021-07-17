import 'package:flutter/material.dart';
import 'package:red_egresados/presentation/theme/text_styles.dart';

class MyTheme {
  static ThemeData get ligthTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blueGrey[900],
      accentColor: Colors.blueGrey,
      scaffoldBackgroundColor: Colors.white,
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
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.blueGrey,
        ),
      ),
      textTheme: TextTheme(
        headline1: AppTextStyle.appBarTitle,
        headline2: AppTextStyle.cardTitle,
        headline3: AppTextStyle.extraContentTitle,
        bodyText1: AppTextStyle.cardContent,
        caption: AppTextStyle.cardDetails,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blueGrey[900],
      accentColor: Colors.blueGrey,
      scaffoldBackgroundColor: Colors.grey,
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
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        headline1: AppTextStyle.appBarTitle,
        headline2: AppTextStyle.cardTitle,
        headline3: AppTextStyle.extraContentTitle,
        bodyText1: AppTextStyle.cardContent,
        caption: AppTextStyle.cardDetails,
      ),
    );
  }
}
