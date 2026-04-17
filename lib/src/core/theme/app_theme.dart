import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  // Private constructor
  AppTheme._();

  // Singleton instance
  static final AppTheme _instance = AppTheme._();

  // Factory constructor
  factory AppTheme() {
    return _instance;
  }

  // Use a private variable to hold the theme mode
  ThemeMode _themeMode = ThemeMode.system;

  // Getter for the theme mode
  ThemeMode get themeMode => _themeMode;

  // Setter to change the theme mode and notify listeners
  void setThemeMode(ThemeMode mode) {
    if (mode != _themeMode) {
      _themeMode = mode;
      notifyListeners();
    }
  }
}
