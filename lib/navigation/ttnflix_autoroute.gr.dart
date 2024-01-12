// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:ttnflix/app_loader/app_loader_screen.dart' as _i1;
import 'package:ttnflix/home/home_screen.dart' as _i2;
import 'package:ttnflix/home/model/movie_list.dart' as _i6;
import 'package:ttnflix/movie_detail/screen/movie_detail_screen.dart' as _i3;

abstract class $TtnFlixAppRouter extends _i4.RootStackRouter {
  $TtnFlixAppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AppLoaderScreenRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppLoaderScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.HomeScreen(key: args.key),
      );
    },
    MovieDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailScreenRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.MovieDetailScreen(
          key: args.key,
          movie: args.movie,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AppLoaderScreen]
class AppLoaderScreenRoute extends _i4.PageRouteInfo<void> {
  const AppLoaderScreenRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AppLoaderScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppLoaderScreenRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i4.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          HomeScreenRoute.name,
          args: HomeScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i4.PageInfo<HomeScreenRouteArgs> page =
      _i4.PageInfo<HomeScreenRouteArgs>(name);
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.MovieDetailScreen]
class MovieDetailScreenRoute
    extends _i4.PageRouteInfo<MovieDetailScreenRouteArgs> {
  MovieDetailScreenRoute({
    _i5.Key? key,
    required _i6.Movie movie,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          MovieDetailScreenRoute.name,
          args: MovieDetailScreenRouteArgs(
            key: key,
            movie: movie,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailScreenRoute';

  static const _i4.PageInfo<MovieDetailScreenRouteArgs> page =
      _i4.PageInfo<MovieDetailScreenRouteArgs>(name);
}

class MovieDetailScreenRouteArgs {
  const MovieDetailScreenRouteArgs({
    this.key,
    required this.movie,
  });

  final _i5.Key? key;

  final _i6.Movie movie;

  @override
  String toString() {
    return 'MovieDetailScreenRouteArgs{key: $key, movie: $movie}';
  }
}
