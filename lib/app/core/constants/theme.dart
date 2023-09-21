import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final gFonts = GoogleFonts.nunitoSans(
  fontSize: 15.5,
  color: const Color.fromARGB(255, 0, 0, 0),
);

ThemeData appTheme = ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: false,
    backgroundColor: Colors.white,
    elevation: .5,
    titleTextStyle: gFonts.copyWith(fontSize: 20, color: Colors.black87),
    iconTheme: const IconThemeData(color: Colors.black87, size: 20),
  ),
  iconTheme: const IconThemeData(color: Colors.black87, size: 20),
  textTheme: TextTheme(
    bodyLarge: gFonts,
    bodyMedium: gFonts,
    titleMedium: gFonts,
    titleSmall: gFonts,
  ),
);
