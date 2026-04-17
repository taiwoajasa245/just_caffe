import 'package:flutter/material.dart';

class AppTypographyExtension extends ThemeExtension<AppTypographyExtension> {
  AppTypographyExtension({
    required this.heading1,
    required this.heading2,
    required this.heading3,
    required this.heading4,
    required this.body1,
    required this.body2,
    required this.body3,
    required this.body4,
    required this.paragraphRegular,
    required this.paragraphMedium,
    required this.paragraphSmall,
    required this.paragraphBig,
  });

  final TextStyle heading1;
  final TextStyle heading2;
  final TextStyle heading3;
  final TextStyle heading4;
  final TextStyle body1;
  final TextStyle body2;
  final TextStyle body3;
  final TextStyle body4;
  final TextStyle paragraphRegular;
  final TextStyle paragraphMedium;
  final TextStyle paragraphSmall;
  final TextStyle paragraphBig;

  @override
  ThemeExtension<AppTypographyExtension> copyWith({
    TextStyle? heading1,
    TextStyle? heading2,
    TextStyle? heading3,
    TextStyle? heading4,
    TextStyle? body1,
    TextStyle? body2,
    TextStyle? body3,
    TextStyle? body4,
    TextStyle? paragraphRegular,
    TextStyle? paragraphMedium,
    TextStyle? paragraphSmall,
    TextStyle? paragraphBig,
  }) {
    return AppTypographyExtension(
      heading1: heading1 ?? this.heading1,
      heading2: heading2 ?? this.heading2,
      heading3: heading3 ?? this.heading3,
      heading4: heading4 ?? this.heading4,
      body1: body1 ?? this.body1,
      body2: body2 ?? this.body2,
      body3: body3 ?? this.body3,
      body4: body4 ?? this.body4,
      paragraphRegular: paragraphRegular ?? this.paragraphRegular,
      paragraphMedium: paragraphMedium ?? this.paragraphMedium,
      paragraphSmall: paragraphSmall ?? this.paragraphSmall,
      paragraphBig: paragraphBig ?? this.paragraphBig,
    );
  }

  @override
  ThemeExtension<AppTypographyExtension> lerp(
    covariant ThemeExtension<AppTypographyExtension>? other,
    double t,
  ) {
    if (other is! AppTypographyExtension) {
      return this;
    }

    return AppTypographyExtension(
      heading1: TextStyle.lerp(heading1, other.heading1, t)!,
      heading2: TextStyle.lerp(heading2, other.heading2, t)!,
      heading3: TextStyle.lerp(heading3, other.heading3, t)!,
      heading4: TextStyle.lerp(heading4, other.heading4, t)!,
      body1: TextStyle.lerp(body1, other.body1, t)!,
      body2: TextStyle.lerp(body2, other.body2, t)!,
      body3: TextStyle.lerp(body3, other.body3, t)!,
      body4: TextStyle.lerp(body4, other.body4, t)!,
      paragraphRegular: TextStyle.lerp(paragraphRegular, other.paragraphRegular, t)!,
      paragraphMedium: TextStyle.lerp(paragraphMedium, other.paragraphMedium, t)!,
      paragraphSmall: TextStyle.lerp(paragraphSmall, other.paragraphSmall, t)!,
      paragraphBig: TextStyle.lerp(paragraphBig, other.paragraphBig, t)!,

    );
  }
}
