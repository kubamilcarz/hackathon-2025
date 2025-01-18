import 'package:flutter/material.dart';

/// An extension for theme to provide a color palette in context.
class ColorPalette extends ThemeExtension<ColorPalette> {
  const ColorPalette({
    required this.roadSafety,
    required this.iconsPrimary,
    required this.air,
    required this.feedback,
    required this.noise,
    required this.iconsSecondary,
    required this.backgroundPrimary,
    required this.backgroundSecondary,
  });

  final Color roadSafety;
  final Color iconsPrimary;
  final Color air;
  final Color feedback;
  final Color noise;
  final Color iconsSecondary;
  final Color backgroundPrimary;
  final Color backgroundSecondary;

  @override
  ThemeExtension<ColorPalette> copyWith({
    Color? roadSafety,
    Color? iconsPrimary,
    Color? air,
    Color? feedback,
    Color? noise,
    Color? iconsSecondary,
    Color? backgroundPrimary,
    Color? backgroundSecondary,
  }) =>
      ColorPalette(
        backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
        roadSafety: roadSafety ?? this.roadSafety,
        iconsPrimary: iconsPrimary ?? this.iconsPrimary,
        air: air ?? this.air,
        feedback: feedback ?? this.feedback,
        noise: noise ?? this.noise,
        iconsSecondary: iconsSecondary ?? this.iconsSecondary,
        backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      );

  @override
  ThemeExtension<ColorPalette> lerp(
    covariant ThemeExtension<ColorPalette>? other,
    double t,
  ) {
    if (other == null || other is! ColorPalette) {
      return this;
    }

    return ColorPalette(
      backgroundPrimary:
          Color.lerp(backgroundPrimary, other.backgroundPrimary, t)!,
      backgroundSecondary:
          Color.lerp(backgroundSecondary, other.backgroundSecondary, t)!,
      roadSafety: Color.lerp(roadSafety, other.roadSafety, t)!,
      iconsPrimary: Color.lerp(iconsPrimary, other.iconsPrimary, t)!,
      air: Color.lerp(air, other.air, t)!,
      feedback: Color.lerp(feedback, other.feedback, t)!,
      noise: Color.lerp(noise, other.noise, t)!,
      iconsSecondary: Color.lerp(iconsSecondary, other.iconsSecondary, t)!,
    );
  }

  Map<String, Color> toMap() => {
        'BackgroundPrimary': backgroundPrimary,
        'BackgroundSecondary': backgroundSecondary,
        'Road safety': roadSafety,
        'Icons Primary': iconsPrimary,
        'Air': air,
        'Feedback': feedback,
        'Noise': noise,
        'Icons Secondary': iconsSecondary,
      };

  static const lightPalette = ColorPalette(
    backgroundPrimary: Color(0xFFFFFFFF),
    backgroundSecondary: Color(0xFF000000),
    roadSafety: Color(0xFFEC008C),
    iconsPrimary: Color(0xFF4763B8),
    iconsSecondary: Color(0xFF353535),
    air: Color(0xFF33BDF2),
    feedback: Color(0xFF80CC28),
    noise: Color(0xFFFCBD09),
  );
}
