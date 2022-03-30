import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        // scaffoldBackgroundColor: const Color.fromRGBO(241, 241, 241, 1),
        cardColor: Colors.white,
        canvasColor: bgColor,
        secondaryHeaderColor: subText,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: darkColor,
          foregroundColor: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          toolbarTextStyle: const TextStyle(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        brightness: Brightness.dark,
        // scaffoldBackgroundColor: Colors.white12,
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo.shade400,
          foregroundColor: Colors.white,
        ),
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.white60,
        appBarTheme: AppBarTheme(
          color: Colors.black87,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          toolbarTextStyle: const TextStyle(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
      );

  static Color darkColor = const Color.fromRGBO(0, 27, 53, 1);
  static Color bgColor = const Color.fromRGBO(241, 241, 241, 1);
  static Color subText = Colors.black54;

  static Color darkCreamColor = Colors.grey.shade900;
  static Color lightBluishColor = Colors.purple.shade200;
}
