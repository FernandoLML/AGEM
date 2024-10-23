import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colorFont.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true, // Habilita Material Design 3

      // Define a paleta de cores usando `ColorScheme`
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF1D5637),
        brightness: Brightness.light,
      ),

      // Definição do tema de texto com as fontes corretas
      textTheme: TextTheme(
        displayLarge: GoogleFonts.montserrat(
          textStyle: AppTextStyles.h1,
        ),
        displayMedium: GoogleFonts.montserrat(
          textStyle: AppTextStyles.h2,
        ),
        displaySmall: GoogleFonts.montserrat(
          textStyle: AppTextStyles.h3,
        ),
        titleLarge: GoogleFonts.montserrat(
          textStyle: AppTextStyles.subtitle,
        ),
        bodyLarge: GoogleFonts.mada(
          textStyle: AppTextStyles.body1,
        ),
        bodyMedium: GoogleFonts.mada(
          textStyle: AppTextStyles.body2,
        ),
        labelLarge: GoogleFonts.mada(
          textStyle: AppTextStyles.buttonBig,
        ),
      ),
    );
  }
}
