import 'package:flutter/material.dart';
import 'package:just_caffe/src/core/theme/app_colors.dart';

// Extension on the build context
extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  /// Returns the current theme's brightness.
  Brightness get brightness => theme.brightness;

  /// Returns whether the app is currently in dark mode.
  /// This checks the resolved theme brightness, which respects
  /// ThemeMode.system, ThemeMode.light, and ThemeMode.dark.
  bool get isDarkMode => theme.brightness == Brightness.dark;

  Color get primaryText =>
      isDarkMode ? AppColors.textIconHighDark : const Color(0xff2F2D2C);
  Color get secondaryText =>
      isDarkMode ? AppColors.textIconMidDark : const Color(0xff9B9B9B);
  Color get surfaceColor =>
      isDarkMode ? AppColors.surfaceSecondaryDark : Colors.white;
  Color get backgroundColor =>
      isDarkMode ? AppColors.surfacePrimaryDark : const Color(0xffF9F9F9);
  Color get dividerColor =>
      isDarkMode ? AppColors.borderDark : const Color(0xffEAEAEA);
  Color get subSurfaceColor =>
      isDarkMode ? const Color(0xFF3A3A3A) : const Color(0xffF4F4F4);
}
