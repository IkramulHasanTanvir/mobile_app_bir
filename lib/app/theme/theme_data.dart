import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_bir/app/utils/constants.dart';



ThemeData themeData(context) => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorSchemeSeed: primaryColor,
    textTheme: _textTheme(),
    elevatedButtonTheme: _elevatedButtonThemeData(context),
    textButtonTheme: _textButtonThemeData(),
    inputDecorationTheme: _inputDecorationTheme(context));




TextButtonThemeData _textButtonThemeData() {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.blue,
      textStyle: GoogleFonts.poppins(
          textStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      )),
    ),
  );
}

InputDecorationTheme _inputDecorationTheme(context) {
  final Size size = MediaQuery.sizeOf(context);
  return InputDecorationTheme(
    suffixIconColor: dividerTextColors,
    hintStyle: GoogleFonts.poppins(
        textStyle:  TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: size.height * 0.018,
    )),
    border: _outlineInputBorder(),
    enabledBorder: _enabledBorder(),
    focusedBorder: _outlineInputBorder(),
    errorBorder: _outlineInputBorder(),
  );
}

OutlineInputBorder _outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: primaryColor),
  );
}

OutlineInputBorder _enabledBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide:  BorderSide(color: dividerTextColors.withOpacity(0.3)),
  );
}

ElevatedButtonThemeData _elevatedButtonThemeData(context) {
  final Size size = MediaQuery.sizeOf(context);
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.height * 0.017),
        ),
        fixedSize:  Size(double.maxFinite, size.height * 0.050),
        textStyle:  TextStyle(fontSize: size.height * 0.020, fontWeight: FontWeight.w600),
    ),
  );
}

TextTheme _textTheme() {
  return const TextTheme(
    bodyMedium: TextStyle(color: Colors.black),
  );
}
