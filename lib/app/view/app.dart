import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:acc_hack/app/router/navigation_observer.dart';
import 'package:acc_hack/app/router/router.dart';
import 'package:acc_hack/app/view/global_providers.dart';
import 'package:acc_hack/l10n/l10n.dart';
import 'package:acc_hack/presentation/feature/theme_switcher/cubit/theme_switcher_cubit.dart';
import 'package:acc_hack/presentation/theme/app_typography.dart';
import 'package:acc_hack/presentation/theme/color_palette.dart';
import 'package:acc_hack/presentation/theme/theme_helpers.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  final ligthTheme = ThemeDataExtensions.createThemeData(
    palette: ColorPalette.lightPalette,
    typography: AppTypography.defaultTypography,
    brightness: Brightness.light,
  );

  final darkTheme = ThemeDataExtensions.createThemeData(
    palette: ColorPalette.lightPalette,
    typography: AppTypography.defaultTypography,
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return GlobalProviders(
      child: BlocBuilder<ThemeSwitcherCubit, ThemeSwitcherState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: state.map(
              lightMode: (_) => ligthTheme,
              darkMode: (_) => darkTheme,
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: _appRouter.config(
              navigatorObservers: () => [NavigationLogger()],
              deepLinkBuilder: (deepLink) {
                if (kIsWeb) {
                  return deepLink;
                }
                if (deepLink.uri.fragment == '/' ||
                    deepLink.uri.fragment.isEmpty) {
                  return DeepLink.defaultPath;
                }
                return DeepLink.path(deepLink.uri.fragment);
              },
            ),
          );
        },
      ),
    );
  }
}
