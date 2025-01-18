// UiText widget to handle different text styles and sizes
import 'package:flutter/material.dart';
import 'package:acc_hack/presentation/theme/app_typography.dart';
import 'package:acc_hack/presentation/theme/theme_helpers.dart';

class UiText extends StatelessWidget {
  const UiText._(
    this.content, {
    this.color,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    TextStyle? Function(AppTypography)? styleBuilder,
  }) : _styleBuilder = styleBuilder;

  /// Creates a [UiText] widget with a large display size.
  factory UiText.mainHeading(
    String content, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.mainHeading,
      );

  /// Creates a [UiText] widget with a medium display size.
  factory UiText.mediumHeading(
    String content, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.mediumHeading,
      );

  /// Creates a [UiText] widget with a small display size.
  factory UiText.smallHeading(
    String content, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.smallHeading,
      );

  /// Creates a [UiText] widget with a large headline size.
  factory UiText.smallHeadingBold(
    String content, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.smallHeadingBold,
      );

  /// Creates a [UiText] widget with a medium headline size.
  factory UiText.bodyTextBig(
    String content, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.bodyTextBig,
      );

  /// Creates a [UiText] widget with a small headline size.
  factory UiText.bodyTextMedium(
    String content, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.bodyTextMedium,
      );

  /// Creates a [UiText] widget with a large title size.
  factory UiText.bodyTextSmall(
    String content, {
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    TextOverflow? overflow,
    int? maxLines,
  }) =>
      UiText._(
        content,
        color: color,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        styleBuilder: (typography) => typography.bodyTextSmall,
      );

  final String content;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? color;
  final TextStyle? Function(AppTypography)? _styleBuilder;

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).appTypography;
    final palette = Theme.of(context).colorPalette;

    // Get the text style based on the size
    final style = _styleBuilder?.call(typography) ?? typography.mainHeading;

    return Text(
      content,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: style.copyWith(color: color ?? palette.iconsSecondary),
    );
  }
}
