import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static final Color primaryLight = Colors.cyan.shade700;
  static final Color primaryDark = Colors.teal.shade500;
  static final lightTheme = ThemeData(
    primarySwatch: Colors.cyan,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    primarySwatch:  Colors.cyan,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
