import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

final List<ThemeData> themes = [
  ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    primaryColor: const Color(0xFFFFFFFF),
    errorColor: Colors.redAccent,
    indicatorColor: Colors.black,
    textTheme: TextTheme(
      bodyText1: GoogleFonts.ubuntu(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodyText2: GoogleFonts.ubuntu(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      headline1: GoogleFonts.ubuntu(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headline2: GoogleFonts.ubuntu(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),
  ),
];