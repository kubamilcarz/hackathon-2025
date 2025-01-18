import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:acc_hack/presentation/common/components/text.dart';
import 'package:acc_hack/presentation/feature/ui_preview/view/color_palette_preview.dart';
import 'package:acc_hack/presentation/feature/ui_preview/view/typography_preview.dart';
import 'package:acc_hack/presentation/theme/theme_helpers.dart';

@RoutePage()
class UiPreviewPage extends StatelessWidget {
  const UiPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const UiPreviewView();
  }
}

class UiPreviewView extends StatelessWidget {
  const UiPreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final brightness = context.brightness;

    return Scaffold(
      backgroundColor: context.colorPalette.backgroundPrimary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: context.colorPalette.backgroundPrimary,
            surfaceTintColor: context.colorPalette.backgroundPrimary,
            pinned: true,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: math.max((size.width - 900) / 2, 16),
              vertical: 24,
            ),
            sliver: SliverList.list(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: UiText.mainHeading('Color Palette'),
                ),
                const SizedBox(height: 8),
                const ColorPalettePreview(),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: UiText.mainHeading('Typography'),
                ),
                const TypographyPreview(),
                const SizedBox(height: 24),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: UiText.mainHeading('Animations'),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
