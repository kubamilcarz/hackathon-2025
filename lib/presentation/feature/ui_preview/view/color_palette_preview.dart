import 'package:flutter/material.dart';
import 'package:acc_hack/presentation/common/components/text.dart';
import 'package:acc_hack/presentation/theme/color_palette.dart';

class ColorPalettePreview extends StatelessWidget {
  const ColorPalettePreview({super.key});

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _PalettePreview(colorPalette: ColorPalette.lightPalette),
            ],
          ),
        ),
      );
}

class _PalettePreview extends StatelessWidget {
  const _PalettePreview({
    required this.colorPalette,
  });

  final ColorPalette colorPalette;

  @override
  Widget build(BuildContext context) => Wrap(
        spacing: 16,
        runSpacing: 16,
        children: colorPalette.toMap().entries.map((entry) {
          final name = entry.key;
          final color = entry.value;

          return SizedBox(
            width: 120,
            height: 100,
            child: Column(
              key: ValueKey(name),
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox.square(
                  dimension: 60,
                  child: Material(
                    color: color,
                    elevation: 2,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 8),
                UiText.smallHeading(
                  name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ],
            ),
          );
        }).toList(),
      );
}
