import 'package:auto_route/auto_route.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:acc_hack/presentation/feature/filters/cubit/filters_cubit.dart';
import 'package:acc_hack/presentation/feature/filters/view/filters_drawer.dart';
import 'package:acc_hack/presentation/theme/theme_helpers.dart';

import '../home.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _AppLogo(),
                SizedBox(height: 8),
                ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 400),
                    child: _PreviewImage()),
                SizedBox(height: 8),
                _MottoText(),
                SizedBox(height: 24),
                MalopolskaLogo(),
                SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppLogo extends StatelessWidget {
  const _AppLogo();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/welloway_logo.png',
      width: 200,
    );
  }
}

class _PreviewImage extends StatelessWidget {
  const _PreviewImage();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/images/home_page_img.jpg',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class _MottoText extends StatelessWidget {
  const _MottoText();

  @override
  Widget build(BuildContext context) {
    return EasyRichText('Enjoy cycling on safe, clean,\nquiet, rated routes in',
        defaultStyle: context.appTypography.mediumHeading,
        textAlign: TextAlign.center,
        patternList: [
          EasyRichTextPattern(
            targetString: 'safe',
            style: context.appTypography.mediumHeading.copyWith(
              color: context.colorPalette.roadSafety,
            ),
          ),
          EasyRichTextPattern(
            targetString: 'clean',
            style: context.appTypography.mediumHeading.copyWith(
              color: context.colorPalette.air,
            ),
          ),
          EasyRichTextPattern(
            targetString: 'quiet',
            style: context.appTypography.mediumHeading.copyWith(
              color: context.colorPalette.noise,
            ),
          ),
          EasyRichTextPattern(
            targetString: 'rated',
            style: context.appTypography.mediumHeading.copyWith(
              color: context.colorPalette.feedback,
            ),
          ),
        ]);
  }
}

class MalopolskaLogo extends StatelessWidget {
  const MalopolskaLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/malopolska_logo.png',
      width: 200,
    );
  }
}
