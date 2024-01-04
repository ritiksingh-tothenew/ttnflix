// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:ttnflix/app_loader/app_loader_screen.dart' as _i1;

abstract class $TtnFlixAppRouter extends _i2.RootStackRouter {
  $TtnFlixAppRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    AppLoaderScreenRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppLoaderScreen(),
      );
    }
  };
}

/// generated route for
/// [_i1.AppLoaderScreen]
class AppLoaderScreenRoute extends _i2.PageRouteInfo<void> {
  const AppLoaderScreenRoute({List<_i2.PageRouteInfo>? children})
      : super(
          AppLoaderScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppLoaderScreenRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
