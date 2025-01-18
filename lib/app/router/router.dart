import 'package:auto_route/auto_route.dart';
import 'package:acc_hack/app/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: DashboardRoute.page,
          children: [
            AutoRoute(
              page: GoogleMapRoute.page,
            ),
            AutoRoute(
              page: HomeRoute.page,
            ),
            AutoRoute(
              page: MyWaysRoute.page,
            ),
          ],
        ),
      ];

  @override
  late final List<AutoRouteGuard> guards = [];
}
