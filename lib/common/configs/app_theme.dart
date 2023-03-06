import 'package:flutter/material.dart';

final primaryTheme = ThemeData.from(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
);

final secondaryTheme = ThemeData.from(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
);

enum AppTheme {
  primary("primary"),
  secondary("secondary");

  final String value;

  const AppTheme(this.value);

  static AppTheme fromValue(String label) {
    return values.firstWhere(
      (v) => v.value == label,
      orElse: () => AppTheme.primary,
    );
  }
}
