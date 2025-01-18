import 'package:flutter/material.dart';
import 'package:acc_hack/presentation/common/components/text.dart';

class TypographyPreview extends StatelessWidget {
  const TypographyPreview({super.key});

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              UiText.mainHeading('Main Heading'),
              const SizedBox(height: 8),
              UiText.mediumHeading('Medium Heading'),
              const SizedBox(height: 8),
              UiText.smallHeading('Small Heading'),
              const SizedBox(height: 24),
              UiText.smallHeadingBold('Small Heading Bold'),
              const SizedBox(height: 8),
              UiText.bodyTextBig('Body Text Big'),
              const SizedBox(height: 8),
              UiText.bodyTextMedium('Body Text Medium'),
              const SizedBox(height: 24),
              UiText.bodyTextSmall('Body Text Small'),
            ],
          ),
        ),
      );
}
