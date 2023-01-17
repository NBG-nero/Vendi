// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../screens/screens.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    Splashscreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Splashscreen(),
      );
    },
    Homescreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Homescreen(),
      );
    },
    Onboarding.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Onboarding(),
      );
    },
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(
          Splashscreen.name,
          path: '/',
        ),
        _i2.RouteConfig(
          Homescreen.name,
          path: '/Homescreen',
        ),
        _i2.RouteConfig(
          Onboarding.name,
          path: '/Onboarding',
        ),
      ];
}

/// generated route for
/// [_i1.Splashscreen]
class Splashscreen extends _i2.PageRouteInfo<void> {
  const Splashscreen()
      : super(
          Splashscreen.name,
          path: '/',
        );

  static const String name = 'Splashscreen';
}

/// generated route for
/// [_i1.Homescreen]
class Homescreen extends _i2.PageRouteInfo<void> {
  const Homescreen()
      : super(
          Homescreen.name,
          path: '/Homescreen',
        );

  static const String name = 'Homescreen';
}

/// generated route for
/// [_i1.Onboarding]
class Onboarding extends _i2.PageRouteInfo<void> {
  const Onboarding()
      : super(
          Onboarding.name,
          path: '/Onboarding',
        );

  static const String name = 'Onboarding';
}
