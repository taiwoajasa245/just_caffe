import 'package:flutter/material.dart';
import 'package:just_caffe/src/core/constants/const.dart';
import 'package:just_caffe/src/core/extension/num_extension.dart';

class AppTextStyles {
  // final bool isDarkmode = Theme.of(context).brightness == Brightness.dark;

  static TextStyle heading1 = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 24.fontSize,
    fontWeight: FontWeight.w600,
  );

  static TextStyle heading2 = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 20.fontSize,
    fontWeight: FontWeight.w600,
  );

  static TextStyle heading3 = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 18.fontSize,
    fontWeight: FontWeight.w600,
  );

  static TextStyle heading4 = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 16.fontSize,
    fontWeight: FontWeight.w600,
  );

  static TextStyle body1 = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 20.fontSize,
    fontWeight: FontWeight.w500,
  );

  static TextStyle body2 = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 18.fontSize,
    fontWeight: FontWeight.w500,
  );

  static TextStyle body3 = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 16.fontSize,
    fontWeight: FontWeight.w500,
  );

  static TextStyle body4 = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 12.fontSize,
    fontWeight: FontWeight.w500,
  );

  static TextStyle paragraphBig = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 20.fontSize,
    fontWeight: FontWeight.w400,
  );

  static TextStyle paragraphRegular = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 16.fontSize,
    fontWeight: FontWeight.w400,
  );

  static TextStyle paragraphMedium = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 12.fontSize,
    fontWeight: FontWeight.w400,
  );

  static TextStyle paragraphSmall = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 10.fontSize,
    fontWeight: FontWeight.w400,
  );
}
