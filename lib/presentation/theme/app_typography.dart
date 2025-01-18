import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// An extension for theme to provide typography in context.
class AppTypography extends ThemeExtension<AppTypography> {
  const AppTypography({
    required this.mainHeading,
    required this.mediumHeading,
    required this.smallHeading,
    required this.smallHeadingBold,
    required this.bodyTextBig,
    required this.bodyTextMedium,
    required this.bodyTextSmall,
  });

  final TextStyle mainHeading;
  final TextStyle mediumHeading;
  final TextStyle smallHeading;
  final TextStyle smallHeadingBold;

  final TextStyle bodyTextBig;
  final TextStyle bodyTextMedium;
  final TextStyle bodyTextSmall;

  @override
  ThemeExtension<AppTypography> copyWith({
    TextStyle? mainHeading,
    TextStyle? mediumHeading,
    TextStyle? smallHeading,
    TextStyle? smallHeadingBold,
    TextStyle? bodyTextBig,
    TextStyle? bodyTextMedium,
    TextStyle? bodyTextSmall,
  }) =>
      AppTypography(
        mainHeading: mainHeading ?? this.mainHeading,
        mediumHeading: mediumHeading ?? this.mediumHeading,
        smallHeading: smallHeading ?? this.smallHeading,
        smallHeadingBold: smallHeadingBold ?? this.smallHeadingBold,
        bodyTextBig: bodyTextBig ?? this.bodyTextBig,
        bodyTextMedium: bodyTextMedium ?? this.bodyTextMedium,
        bodyTextSmall: bodyTextSmall ?? this.bodyTextSmall,
      );

  @override
  ThemeExtension<AppTypography> lerp(
    covariant ThemeExtension<AppTypography>? other,
    double t,
  ) {
    if (other == null || other is! AppTypography) {
      return this;
    }

    return AppTypography(
      mainHeading: TextStyle.lerp(mainHeading, other.mainHeading, t)!,
      mediumHeading: TextStyle.lerp(mediumHeading, other.mediumHeading, t)!,
      smallHeading: TextStyle.lerp(smallHeading, other.smallHeading, t)!,
      smallHeadingBold:
          TextStyle.lerp(smallHeadingBold, other.smallHeadingBold, t)!,
      bodyTextBig: TextStyle.lerp(bodyTextBig, other.bodyTextBig, t)!,
      bodyTextMedium: TextStyle.lerp(bodyTextMedium, other.bodyTextMedium, t)!,
      bodyTextSmall: TextStyle.lerp(bodyTextSmall, other.bodyTextSmall, t)!,
    );
  }

  // use default styles from material2021
  static final _mooli = GoogleFonts.mooli();
  static final _mavenPro = GoogleFonts.mavenPro();

  static final defaultTypography = AppTypography(
    mainHeading: _mooli.copyWith(fontSize: 36, fontWeight: FontWeight.w400),
    mediumHeading: _mooli.copyWith(fontSize: 24, fontWeight: FontWeight.w400),
    smallHeading: _mooli.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
    smallHeadingBold:
        _mavenPro.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
    bodyTextBig: _mooli.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
    bodyTextMedium: _mooli.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
    bodyTextSmall: _mooli.copyWith(fontSize: 10, fontWeight: FontWeight.w400),
  );
}
