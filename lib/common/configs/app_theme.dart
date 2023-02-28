import 'package:flutter/material.dart';

final primaryTheme = ThemeData(
  primaryColor: const Color(0xFFC2BB00),
  primaryColorDark: const Color(0xFFC2BB00),
  cardColor: const Color(0xFFC2BB00),
  cardTheme: CardTheme(
    color: const Color(0xFFED8B16),
    elevation: 8.0,
    margin: const EdgeInsets.all(4.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
  ),
  appBarTheme: const AppBarTheme(color: Color(0xFF003547)),
  scaffoldBackgroundColor: const Color(0xFFFEFBE1),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF003547),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF003547),
      selectedItemColor: Color(0xFFFFF700),
      unselectedItemColor: Color(0xFFFEFBE1),
      showUnselectedLabels: true,
      // this is optional
      elevation: 8.0),
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(secondary: const Color(0xFFED8B16))
      .copyWith(error: const Color(0xFF005E54)),
);
