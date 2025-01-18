import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:acc_hack/presentation/common/components/text.dart';
import 'package:acc_hack/presentation/feature/filters/cubit/filters_cubit.dart';
import 'package:acc_hack/presentation/feature/filters/view/filters_drawer.dart';

@RoutePage()
class MyWaysPage extends StatelessWidget {
  const MyWaysPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                size: 36,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        ),
        drawer: FiltersDrawer(
          onSafeFilterPressed: () {
            context.read<FiltersCubit>().changeFilter(FilterType.safe);
          },
          onCleanFilterPressed: () {
            context.read<FiltersCubit>().changeFilter(FilterType.clean);
          },
          onRatingFilterPressed: () {
            context.read<FiltersCubit>().changeFilter(FilterType.rating);
          },
          onQuietFilterPressed: () {
            context.read<FiltersCubit>().changeFilter(FilterType.quiet);
          },
        ),
        body: const MyWaysView());
  }
}

class MyWaysView extends StatelessWidget {
  const MyWaysView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: const Column(
        children: [
          _MyWaysLogo(),
          SizedBox(
            height: 16,
          ),
          _MyImagesSection(),
          SizedBox(
            height: 16,
          ),
          _FavouriteRoutesSection(),
        ],
      ),
    );
  }
}

class _MyWaysLogo extends StatelessWidget {
  const _MyWaysLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 200, child: Image.asset('assets/images/dupa.png'));
  }
}

class _MyImagesSection extends StatelessWidget {
  const _MyImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UiText.mediumHeading('My images from routes'),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 115,
                height: 98,
                child: Image.asset('assets/images/1.png'),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 115,
                height: 98,
                child: Image.asset('assets/images/2.png'),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 115,
                height: 98,
                child: Image.asset('assets/images/3.png'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _FavouriteRoutesSection extends StatelessWidget {
  const _FavouriteRoutesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            UiText.mediumHeading('My favourite routes'),
            SizedBox(
              height: 16,
            ),
            _FavouriteRoute(type: FilterType.safe),
            SizedBox(
              height: 16,
            ),
            _FavouriteRoute(type: FilterType.clean),
            SizedBox(
              height: 16,
            ),
            _FavouriteRoute(type: FilterType.rating),
          ],
        ),
      ),
    );
  }
}

class _FavouriteRoute extends StatelessWidget {
  const _FavouriteRoute({
    super.key,
    required this.type,
  });

  final FilterType type;

  String getImgPath(FilterType type) {
    switch (type) {
      case FilterType.safe:
        return 'assets/icons/safe.png';
      case FilterType.clean:
        return 'assets/icons/clean.png';
      case FilterType.rating:
        return 'assets/icons/rating.png';
      case FilterType.quiet:
        return 'assets/icons/quiet.png';
    }
  }

  String getText(FilterType type) {
    switch (type) {
      case FilterType.safe:
        return 'Tauron Arena route';
      case FilterType.clean:
        return 'Zakrzewski route';
      case FilterType.rating:
        return 'Wawel route';
      case FilterType.quiet:
        return 'Wieliczka route';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF3F5F5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 70,
              height: 56,
              child: Image.asset(getImgPath(type)),
            ),
            SizedBox(
              width: 8,
            ),
            UiText.smallHeading(getText(type),
                color: context.mapFilterTypeToColor(type)),
            Spacer(),
            SizedBox(
                height: 40,
                width: 40,
                child: Image.asset('assets/images/map.png')),
            SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
