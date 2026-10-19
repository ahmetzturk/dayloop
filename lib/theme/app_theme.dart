import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Ekran taslaklarındaki ana renk (indigo)
  static const Color primary = Color(0xFF4F46E5);

  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: primary),
  );
}
