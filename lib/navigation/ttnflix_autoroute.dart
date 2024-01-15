import 'package:auto_route/auto_route.dart';
import 'package:ttnflix/navigation/ttnflix_autoroute.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen')
class TtnFlixAppRouter extends $TtnFlixAppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AppLoaderScreenRoute.page, initial: true),
        AutoRoute(page: HomeScreenRoute.page),
        AutoRoute(page: SignInScreenRoute.page),
        AutoRoute(page: MovieDetailScreenRoute.page),
        AutoRoute(page: SignUpScreenRoute.page),
      ];
}
