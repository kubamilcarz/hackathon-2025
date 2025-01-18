import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:acc_hack/presentation/common/components/text.dart';
import 'package:acc_hack/presentation/theme/theme_helpers.dart';

import '../filters.dart';

class FiltersDrawer extends StatelessWidget {
  const FiltersDrawer({
    super.key,
    required this.onSafeFilterPressed,
    required this.onCleanFilterPressed,
    required this.onRatingFilterPressed,
    required this.onQuietFilterPressed,
  });

  final VoidCallback onSafeFilterPressed;
  final VoidCallback onCleanFilterPressed;
  final VoidCallback onRatingFilterPressed;
  final VoidCallback onQuietFilterPressed;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FiltersCubit(),
      child: FiltersView(
        onSafeFilterPressed: onSafeFilterPressed,
        onCleanFilterPressed: onCleanFilterPressed,
        onRatingFilterPressed: onRatingFilterPressed,
        onQuietFilterPressed: onQuietFilterPressed,
      ),
    );
  }
}

class FiltersView extends StatelessWidget {
  const FiltersView({
    super.key,
    required this.onSafeFilterPressed,
    required this.onCleanFilterPressed,
    required this.onRatingFilterPressed,
    required this.onQuietFilterPressed,
  });

  final VoidCallback onSafeFilterPressed;
  final VoidCallback onCleanFilterPressed;
  final VoidCallback onRatingFilterPressed;
  final VoidCallback onQuietFilterPressed;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.colorPalette.backgroundPrimary,
      width: 100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          IconButton(
            icon: Icon(
              Icons.menu,
              size: 36,
            ),
            onPressed: () {
              Scaffold.of(context).closeDrawer();
            },
          ),
          // Drawer Items
          _DrawerButton(
            onPressed: onSafeFilterPressed,
            filterType: FilterType.safe,
          ),
          SizedBox(
            height: 8,
          ),
          _DrawerButton(
            onPressed: onCleanFilterPressed,
            filterType: FilterType.clean,
          ),
          SizedBox(
            height: 8,
          ),
          _DrawerButton(
            onPressed: onRatingFilterPressed,
            filterType: FilterType.rating,
          ),
          SizedBox(
            height: 8,
          ),
          _DrawerButton(
            onPressed: onQuietFilterPressed,
            filterType: FilterType.quiet,
          ),
        ],
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton({required this.onPressed, required this.filterType});

  final VoidCallback onPressed;
  final FilterType filterType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.mapFilterTypeToColor(filterType),
                  width: 2,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Image.asset(
                filterType.iconPath,
              ),
            ),
            SizedBox(height: 4),
            UiText.bodyTextMedium(
              filterType.name,
              color: context.mapFilterTypeToColor(filterType),
            ),
          ],
        ),
      ),
    );
  }
}

extension FilterTypeExt on FilterType {
  String get iconPath {
    switch (this) {
      case FilterType.safe:
        return 'assets/icons/filter_safe.png';
      case FilterType.clean:
        return 'assets/icons/filter_clean.png';
      case FilterType.rating:
        return 'assets/icons/filter_rating.png';
      case FilterType.quiet:
        return 'assets/icons/filter_quiet.png';
    }
  }

  String get name {
    switch (this) {
      case FilterType.safe:
        return 'Safe Router';
      case FilterType.clean:
        return 'Clean Router';
      case FilterType.rating:
        return 'Rated Router';
      case FilterType.quiet:
        return 'Quiet Router';
    }
  }
}
