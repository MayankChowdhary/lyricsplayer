import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static final MaterialColor primaryLight = Colors.orange;
  static final MaterialColor primaryDark = Colors.orange;
  static final lightTheme = ThemeData(
    primarySwatch: primaryLight,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    primarySwatch: primaryDark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
