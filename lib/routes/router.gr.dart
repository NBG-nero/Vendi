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
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../Admin/AdminScreens/admin_screens.dart' as _i2;
import '../screens/screens.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    Splashscreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Splashscreen(),
      );
    },
    BottomNav.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.BottomNav(),
      );
    },
    Homescreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Homescreen(),
      );
    },
    Cartscreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Cartscreen(),
      );
    },
    Messagescreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Messagescreen(),
      );
    },
    Accountscreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Accountscreen(),
      );
    },
    Onboarding.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Onboarding(),
      );
    },
    Loginscreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Loginscreen(),
      );
    },
    Resetpasswordscreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.Resetpasswordscreen(),
      );
    },
    SignUpscreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SignUpscreen(),
      );
    },
    AdminHomescreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AdminHomescreen(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          Splashscreen.name,
          path: '/',
        ),
        _i3.RouteConfig(
          BottomNav.name,
          path: '/bottom-nav',
        ),
        _i3.RouteConfig(
          Homescreen.name,
          path: '/Homescreen',
        ),
        _i3.RouteConfig(
          Cartscreen.name,
          path: '/Cartscreen',
        ),
        _i3.RouteConfig(
          Messagescreen.name,
          path: '/Messagescreen',
        ),
        _i3.RouteConfig(
          Accountscreen.name,
          path: '/Accountscreen',
        ),
        _i3.RouteConfig(
          Onboarding.name,
          path: '/Onboarding',
        ),
        _i3.RouteConfig(
          Loginscreen.name,
          path: '/Loginscreen',
        ),
        _i3.RouteConfig(
          Resetpasswordscreen.name,
          path: '/Resetpasswordscreen',
        ),
        _i3.RouteConfig(
          SignUpscreen.name,
          path: '/sign-upscreen',
        ),
        _i3.RouteConfig(
          AdminHomescreen.name,
          path: '/admin-homescreen',
        ),
      ];
}

/// generated route for
/// [_i1.Splashscreen]
class Splashscreen extends _i3.PageRouteInfo<void> {
  const Splashscreen()
      : super(
          Splashscreen.name,
          path: '/',
        );

  static const String name = 'Splashscreen';
}

/// generated route for
/// [_i1.BottomNav]
class BottomNav extends _i3.PageRouteInfo<void> {
  const BottomNav()
      : super(
          BottomNav.name,
          path: '/bottom-nav',
        );

  static const String name = 'BottomNav';
}

/// generated route for
/// [_i1.Homescreen]
class Homescreen extends _i3.PageRouteInfo<void> {
  const Homescreen()
      : super(
          Homescreen.name,
          path: '/Homescreen',
        );

  static const String name = 'Homescreen';
}

/// generated route for
/// [_i1.Cartscreen]
class Cartscreen extends _i3.PageRouteInfo<void> {
  const Cartscreen()
      : super(
          Cartscreen.name,
          path: '/Cartscreen',
        );

  static const String name = 'Cartscreen';
}

/// generated route for
/// [_i1.Messagescreen]
class Messagescreen extends _i3.PageRouteInfo<void> {
  const Messagescreen()
      : super(
          Messagescreen.name,
          path: '/Messagescreen',
        );

  static const String name = 'Messagescreen';
}

/// generated route for
/// [_i1.Accountscreen]
class Accountscreen extends _i3.PageRouteInfo<void> {
  const Accountscreen()
      : super(
          Accountscreen.name,
          path: '/Accountscreen',
        );

  static const String name = 'Accountscreen';
}

/// generated route for
/// [_i1.Onboarding]
class Onboarding extends _i3.PageRouteInfo<void> {
  const Onboarding()
      : super(
          Onboarding.name,
          path: '/Onboarding',
        );

  static const String name = 'Onboarding';
}

/// generated route for
/// [_i1.Loginscreen]
class Loginscreen extends _i3.PageRouteInfo<void> {
  const Loginscreen()
      : super(
          Loginscreen.name,
          path: '/Loginscreen',
        );

  static const String name = 'Loginscreen';
}

/// generated route for
/// [_i1.Resetpasswordscreen]
class Resetpasswordscreen extends _i3.PageRouteInfo<void> {
  const Resetpasswordscreen()
      : super(
          Resetpasswordscreen.name,
          path: '/Resetpasswordscreen',
        );

  static const String name = 'Resetpasswordscreen';
}

/// generated route for
/// [_i1.SignUpscreen]
class SignUpscreen extends _i3.PageRouteInfo<void> {
  const SignUpscreen()
      : super(
          SignUpscreen.name,
          path: '/sign-upscreen',
        );

  static const String name = 'SignUpscreen';
}

/// generated route for
/// [_i2.AdminHomescreen]
class AdminHomescreen extends _i3.PageRouteInfo<void> {
  const AdminHomescreen()
      : super(
          AdminHomescreen.name,
          path: '/admin-homescreen',
        );

  static const String name = 'AdminHomescreen';
}
