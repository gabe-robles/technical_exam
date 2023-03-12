import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {

  static ThemeData data = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF033778),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFFFA7500),
      onSecondary: Color(0xFFFFFFFF),
      error: Color(0xFFBA3C36),
      onError: Color(0xFFFFFFFF),
      background: Color(0xFFFAF9F6),
      onBackground: Color(0xFF333333),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF333333),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.montserrat(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        // height: 64.0,
        letterSpacing: 0.0,
        color: const Color(0xFF333333),
      ),
      displayMedium: GoogleFonts.montserrat(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        // height: 52.0,
        letterSpacing: 0.0,
        color: const Color(0xFF333333),
      ),
      displaySmall: GoogleFonts.montserrat(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        // height: 44.0,
        letterSpacing: 0.0,
        color: const Color(0xFF333333),
      ),
      headlineLarge: GoogleFonts.montserrat(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        // height: 40.0,
        letterSpacing: 0.0,
        color: const Color(0xFF333333),
      ),
      headlineMedium: GoogleFonts.montserrat(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        // height: 36.0,
        letterSpacing: 0.0,
        color: const Color(0xFF333333),
      ),
      headlineSmall: GoogleFonts.montserrat(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        // height: 32.0,
        letterSpacing: 0.0,
        color: const Color(0xFF333333),
      ),
      titleLarge: GoogleFonts.montserrat(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        // height: 28.0,
        letterSpacing: 0.0,
        color: const Color(0xFF333333),
      ),
      titleMedium: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        // height: 24.0,
        letterSpacing: 0.15,
        color: const Color(0xFF333333),
      ),
      titleSmall: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        // height: 20.0,
        letterSpacing: 0.1,
        color: const Color(0xFF333333),
      ),
      labelLarge: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        // height: 20.0,
        letterSpacing: 0.1,
        color: const Color(0xFF333333),
      ),
      labelMedium: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        // height: 16.0,
        letterSpacing: 0.5,
        color: const Color(0xFF333333),
      ),
      labelSmall: GoogleFonts.montserrat(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        // height: 16.0,
        letterSpacing: 0.5,
        color: const Color(0xFF333333),
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        // height: 24.0,
        letterSpacing: 0.15,
        color: const Color(0xFF333333),
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        // height: 20.0,
        letterSpacing: 0.25,
        color: const Color(0xFF333333),
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        // height: 16.0,
        letterSpacing: 0.4,
        color: const Color(0xFF333333),
      ),
    ),
  );

}