import 'package:just_caffe/src/core/constants/const.dart';
import 'package:just_caffe/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.surfacePrimaryDark,
  appBarTheme: AppBarTheme(backgroundColor: AppColors.surfacePrimaryDark),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(AppColors.surfacePrimaryDark),
    trackColor: WidgetStateProperty.all(AppColors.surfaceBrandDark),
  ),
  checkboxTheme: CheckboxThemeData(
    // fillColor: WidgetStateProperty.all(AppColors.surfaceBrandDark),
    // checkColor: WidgetStateProperty.all(AppColors.staticLight),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColors.surfaceBrandDark,
    linearTrackColor: AppColors.surfaceBrandSecondaryDark,
    circularTrackColor: AppColors.surfaceBrandSecondaryDark,
    borderRadius: BorderRadius.circular(10),
    linearMinHeight: 6,
  ),
  iconTheme: IconThemeData(color: AppColors.textIconHighDark),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: AppColors.textIconHighDark),
    bodyLarge: TextStyle(color: AppColors.textIconHighDark),
  ),
  fontFamily: kFontFamily,
);
