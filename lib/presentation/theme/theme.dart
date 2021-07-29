import 'package:flutter/material.dart';
import 'package:red_egresados/presentation/theme/colors.dart';
import 'package:red_egresados/presentation/theme/text_styles.dart';

class MyTheme {
  static ThemeData get ligthTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blueGrey[900],
      accentColor: AppColors.mountainMeadow,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Montserrat',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: AppColors.mountainMeadow,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.grey.shade300,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: AppColors.mountainMeadow,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 2.0,
      ),
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline1: AppTextStyle.appBarTitle,
        headline2: AppTextStyle.cardTitle,
        headline3: AppTextStyle.extraContentTitle,
        headline4: AppTextStyle.chatContentTitle,
        bodyText1: AppTextStyle.cardContent,
        bodyText2: AppTextStyle.chatContent,
        caption: AppTextStyle.cardDetails,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blueGrey[900],
      accentColor: AppColors.mountainMeadow,
      scaffoldBackgroundColor: Colors.grey[800],
      fontFamily: 'Montserrat',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: AppColors.mountainMeadow,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.grey.shade300,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.white70,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[900],
      ),
      cardTheme: CardTheme(
        color: Colors.grey[850],
        elevation: 2.0,
      ),
      iconTheme: IconThemeData(color: Colors.white70),
      textTheme: TextTheme(
        headline1: AppTextStyle.appBarTitleDark,
        headline2: AppTextStyle.cardTitleDark,
        headline3: AppTextStyle.extraContentTitleDark,
        headline4: AppTextStyle.chatContentTitleDark,
        bodyText1: AppTextStyle.cardContentDark,
        bodyText2: AppTextStyle.chatContentDark,
        caption: AppTextStyle.cardDetailsDark,
      ),
    );
  }
}
