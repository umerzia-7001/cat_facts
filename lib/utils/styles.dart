import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

mixin Styles {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColor.PRIMARY_500,
    iconTheme: const IconThemeData(color: Colors.black, size: 15),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: AppColor.LM_BACKGROUND_BASIC,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        color: AppColor.LM_BACKGROUND_BASIC,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: AppColor.LM_BACKGROUND_BASIC,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme(
      background: AppColor.LM_BACKGROUND_BASIC,
      brightness: Brightness.light,
      error: AppColor.RED,
      onBackground: AppColor.LM_BACKGROUND_BASIC,
      onError: AppColor.RED,
      onPrimary: AppColor.BLUE,
      onSecondary: AppColor.PRIMARY_700,
      onSurface: AppColor.PRIMARY_500,
      primary: AppColor.BLUE,
      secondary: AppColor.PRIMARY_700,
      surface: AppColor.PRIMARY_500,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColor.BLUE,
    iconTheme: const IconThemeData(color: Colors.black, size: 15),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: AppColor.LM_BACKGROUND_BASIC,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        color: AppColor.LM_BACKGROUND_BASIC,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: AppColor.LM_BACKGROUND_BASIC,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
