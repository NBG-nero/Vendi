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
    BottomNav.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.BottomNav(),
      );
    },
    Homescreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Homescreen(),
      );
    },
    Cartscreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Cartscreen(),
      );
    },
    Messagescreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Messagescreen(),
      );
    },
    Accountscreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Accountscreen(),
      );
    },
    Onboarding.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Onboarding(),
      );
    },
    Loginscreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Loginscreen(),
      );
    },
    Resetpasswordscreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Resetpasswordscreen(),
      );
    },
    SignUpscreen.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SignUpscreen(),
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
          BottomNav.name,
          path: '/bottom-nav',
        ),
        _i2.RouteConfig(
          Homescreen.name,
          path: '/Homescreen',
        ),
        _i2.RouteConfig(
          Cartscreen.name,
          path: '/Cartscreen',
        ),
        _i2.RouteConfig(
          Messagescreen.name,
          path: '/Messagescreen',
        ),
        _i2.RouteConfig(
          Accountscreen.name,
          path: '/Accountscreen',
        ),
        _i2.RouteConfig(
          Onboarding.name,
          path: '/Onboarding',
        ),
        _i2.RouteConfig(
          Loginscreen.name,
          path: '/Loginscreen',
        ),
        _i2.RouteConfig(
          Resetpasswordscreen.name,
          path: '/Resetpasswordscreen',
        ),
        _i2.RouteConfig(
          SignUpscreen.name,
          path: '/sign-upscreen',
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
/// [_i1.BottomNav]
class BottomNav extends _i2.PageRouteInfo<void> {
  const BottomNav()
      : super(
          BottomNav.name,
          path: '/bottom-nav',
        );

  static const String name = 'BottomNav';
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
/// [_i1.Cartscreen]
class Cartscreen extends _i2.PageRouteInfo<void> {
  const Cartscreen()
      : super(
          Cartscreen.name,
          path: '/Cartscreen',
        );

  static const String name = 'Cartscreen';
}

/// generated route for
/// [_i1.Messagescreen]
class Messagescreen extends _i2.PageRouteInfo<void> {
  const Messagescreen()
      : super(
          Messagescreen.name,
          path: '/Messagescreen',
        );

  static const String name = 'Messagescreen';
}

/// generated route for
/// [_i1.Accountscreen]
class Accountscreen extends _i2.PageRouteInfo<void> {
  const Accountscreen()
      : super(
          Accountscreen.name,
          path: '/Accountscreen',
        );

  static const String name = 'Accountscreen';
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

/// generated route for
/// [_i1.Loginscreen]
class Loginscreen extends _i2.PageRouteInfo<void> {
  const Loginscreen()
      : super(
          Loginscreen.name,
          path: '/Loginscreen',
        );

  static const String name = 'Loginscreen';
}

/// generated route for
/// [_i1.Resetpasswordscreen]
class Resetpasswordscreen extends _i2.PageRouteInfo<void> {
  const Resetpasswordscreen()
      : super(
          Resetpasswordscreen.name,
          path: '/Resetpasswordscreen',
        );

  static const String name = 'Resetpasswordscreen';
}

/// generated route for
/// [_i1.SignUpscreen]
class SignUpscreen extends _i2.PageRouteInfo<void> {
  const SignUpscreen()
      : super(
          SignUpscreen.name,
          path: '/sign-upscreen',
        );

  static const String name = 'SignUpscreen';
}
