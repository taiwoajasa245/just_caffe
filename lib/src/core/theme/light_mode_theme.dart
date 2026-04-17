import 'package:just_caffe/src/core/constants/const.dart';
import 'package:just_caffe/src/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.surfacePrimaryLight,
  appBarTheme: AppBarTheme(backgroundColor: AppColors.surfacePrimaryLight),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(AppColors.surfacePrimaryLight),
    trackColor: WidgetStateProperty.all(AppColors.surfaceBrandLight),
    trackOutlineColor: WidgetStateProperty.all(AppColors.surfaceBrandLight),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.all(AppColors.surfaceBrandLight),
    checkColor: WidgetStateProperty.all(AppColors.surfacePrimaryLight),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColors.surfaceBrandLight,
    linearTrackColor: AppColors.surfaceBrandSecondaryLight,
    circularTrackColor: AppColors.surfaceBrandSecondaryLight,
    borderRadius: BorderRadius.circular(10),
    linearMinHeight: 6,
  ),
  iconTheme: IconThemeData(color: AppColors.textIconHighLight),

  fontFamily: kFontFamily,
);
