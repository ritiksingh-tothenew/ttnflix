import 'package:auto_route/auto_route.dart';
import 'package:ttnflix/navigation/ttnflix_autoroute.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen')
class TtnFlixAppRouter extends $TtnFlixAppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeScreenRoute.page, initial: true),
      ];
}
