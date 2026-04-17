import 'package:flutter/material.dart';

class AppThemeColorsExtension extends ThemeExtension<AppThemeColorsExtension> {
  const AppThemeColorsExtension({
    required this.surfacePrimary,
    required this.surfaceBrand,
    required this.surfaceBrandSecondary,
    required this.surfaceError,
    required this.textIconHigh,
    required this.textIconMid,
    required this.border,
    required this.staticGreen,
    required this.accent,
  });

  final Color surfacePrimary;
  final Color surfaceBrand;
  final Color surfaceBrandSecondary;
  final Color surfaceError;
  final Color textIconHigh;
  final Color textIconMid;
  final Color border;
  final Color staticGreen;
  final Color accent;

  @override
  ThemeExtension<AppThemeColorsExtension> copyWith({
    Color? surfacePrimary,
    Color? surfaceBrand,
    Color? surfaceBrandSecondary,
    Color? surfaceError,
    Color? textIconHigh,
    Color? textIconMid,
    Color? border,
    Color? staticGreen,
    Color? accent,
  }) {
    return AppThemeColorsExtension(
      surfacePrimary: surfacePrimary ?? this.surfacePrimary,
      surfaceBrand: surfaceBrand ?? this.surfaceBrand,
      surfaceBrandSecondary:
          surfaceBrandSecondary ?? this.surfaceBrandSecondary,
      surfaceError: surfaceError ?? this.surfaceError,
      textIconHigh: textIconHigh ?? this.textIconHigh,
      textIconMid: textIconMid ?? this.textIconMid,
      border: border ?? this.border,
      staticGreen: staticGreen ?? this.staticGreen,
      accent: accent ?? this.accent,
    );
  }

  @override
  ThemeExtension<AppThemeColorsExtension> lerp(
    covariant ThemeExtension<AppThemeColorsExtension>? other,
    double t,
  ) {
    if (other is! AppThemeColorsExtension) {
      return this;
    }
    return AppThemeColorsExtension(
      surfacePrimary: Color.lerp(surfacePrimary, other.surfacePrimary, t)!,
      surfaceBrand: Color.lerp(surfaceBrand, other.surfaceBrand, t)!,
      surfaceBrandSecondary: Color.lerp(
        surfaceBrandSecondary,
        other.surfaceBrandSecondary,
        t,
      )!,
      surfaceError: Color.lerp(surfaceError, other.surfaceError, t)!,
      textIconHigh: Color.lerp(textIconHigh, other.textIconHigh, t)!,
      textIconMid: Color.lerp(textIconMid, other.textIconMid, t)!,
      border: Color.lerp(border, other.border, t)!,
      staticGreen: Color.lerp(staticGreen, other.staticGreen, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
    );
  }
}
