import 'package:acc_hack/app/router/router.gr.dart';
import 'package:acc_hack/presentation/theme/theme_helpers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        MyWaysRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          selectedItemColor: context.colorPalette.noise,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(size: 28, Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(size: 28, Icons.person_pin_circle_rounded),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(size: 28, Icons.star_border),
              label: 'My ways',
            )
          ],
        );
      },
    );
  }
}
