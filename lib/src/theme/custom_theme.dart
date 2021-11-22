import 'package:flutter/material.dart';

final AppTheme = ThemeData(visualDensity: VisualDensity.standard).copyWith(
    scaffoldBackgroundColor: Colors.blueGrey[50],
    textTheme: const TextTheme(
      button: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      subtitle1: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(30),
      ),
      fillColor: Colors.white,
      filled: true,
      hintStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            const EdgeInsets.fromLTRB(25, 10, 25, 10)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        backgroundColor: MaterialStateProperty.all(Colors.grey[400]!),
      ),
    ),
    iconTheme: IconThemeData(color: Colors.grey[200]!),
    buttonTheme: const ButtonThemeData(splashColor: Colors.transparent),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    ));
