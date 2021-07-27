import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

// Static getters for text styles
class AppTextStyle {
  // Headline 1
  static TextStyle get appBarTitle => GoogleFonts.openSans(
        fontSize: 18.0,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      );
  // Headline 2
  static TextStyle get cardTitle => GoogleFonts.openSans(
        fontSize: 16.0,
        color: AppColors.doveGray,
        fontWeight: FontWeight.w600,
      );
  // Bodytext 1
  static TextStyle get cardContent => GoogleFonts.roboto(
        fontSize: 16.0,
        color: Colors.black,
      );
  // Caption
  static TextStyle get cardDetails => GoogleFonts.openSans(
        fontSize: 16.0,
        color: AppColors.mountainMeadow,
        fontWeight: FontWeight.w600,
      );

  // Dark Theme

  // Headline 1
  static TextStyle get appBarTitleDark => GoogleFonts.openSans(
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      );
  // Headline 2
  static TextStyle get cardTitleDark => GoogleFonts.openSans(
        fontSize: 16.0,
        color: Colors.white70,
        fontWeight: FontWeight.w600,
      );
  // Headline 3
  static TextStyle get extraContentTitleDark => GoogleFonts.openSans(
        fontSize: 14.0,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      );
  // Bodytext 1
  static TextStyle get cardContentDark => GoogleFonts.roboto(
        fontSize: 16.0,
        color: Colors.white70,
      );
  // Caption
  static TextStyle get cardDetailsDark => GoogleFonts.openSans(
        fontSize: 16.0,
        color: AppColors.mountainMeadow,
        fontWeight: FontWeight.w600,
      );
}
