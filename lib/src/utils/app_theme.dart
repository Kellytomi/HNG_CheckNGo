import 'package:checkngo/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: kBGColor,
      appBarTheme: const AppBarTheme().copyWith(
        elevation: 0.0,
        color: kBGColor,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: false,
        titleTextStyle: GoogleFonts.montserrat(
          color: kFontColor1,
          fontWeight: FontWeight.w600,
          fontSize: 24.0,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0.0),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.all(kFontColor2),
          minimumSize: WidgetStateProperty.all(
            const Size(double.infinity, 48.52),
          ),
          textStyle: WidgetStateProperty.all(
            GoogleFonts.inter(
              fontSize: 16.05,
              color: kFontColor2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0.0),
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          foregroundColor: WidgetStateProperty.all(kPrimaryColor),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
          side: WidgetStateProperty.all(
            const BorderSide(color: kPrimaryColor, width: 1.0),
          ),
          minimumSize: WidgetStateProperty.all(
            const Size(double.infinity, 48.52),
          ),
          textStyle: WidgetStateProperty.all(
            GoogleFonts.inter(
              fontSize: 20.0,
              color: kPrimaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0.0),
          backgroundColor: WidgetStateProperty.all(kPrimaryColor),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
          minimumSize: WidgetStateProperty.all(
            const Size(double.infinity, 48.52),
          ),
          textStyle: WidgetStateProperty.all(
            GoogleFonts.inter(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        elevation: 0.0,
        backgroundColor: kBGColor,
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStateTextStyle.resolveWith((state) {
          if (state.contains(WidgetState.selected)) {
            return GoogleFonts.montserrat(
              fontSize: 16.0,
              color: kPrimaryColor,
              fontWeight: FontWeight.w600,
            );
          }
          return GoogleFonts.montserrat(
            fontSize: 16.0,
            color: kOnSurfaceColor,
            fontWeight: FontWeight.w500,
          );
        }),
      ),
    );
  }
}
