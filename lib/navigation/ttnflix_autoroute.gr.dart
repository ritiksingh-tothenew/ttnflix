// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:ttnflix/app_loader/app_loader_screen.dart' as _i1;
import 'package:ttnflix/home/home_screen.dart' as _i2;

abstract class $TtnFlixAppRouter extends _i3.RootStackRouter {
  $TtnFlixAppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AppLoaderScreenRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppLoaderScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.HomeScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AppLoaderScreen]
class AppLoaderScreenRoute extends _i3.PageRouteInfo<void> {
  const AppLoaderScreenRoute({List<_i3.PageRouteInfo>? children})
      : super(
          AppLoaderScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppLoaderScreenRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i3.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          HomeScreenRoute.name,
          args: HomeScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i3.PageInfo<HomeScreenRouteArgs> page =
      _i3.PageInfo<HomeScreenRouteArgs>(name);
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key}';
  }
}
