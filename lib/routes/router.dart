import 'package:auto_route/annotations.dart';
import '../screens/screens.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page, Route',
  routes: <AutoRoute>[
    AutoRoute(page: Splashscreen, initial: true),
    AutoRoute(page: BottomNav),


    AutoRoute(page: Homescreen),
    AutoRoute(page: Cartscreen),
    AutoRoute(page: Messagescreen),
    AutoRoute(page: Accountscreen),

    AutoRoute(page: Onboarding),
    AutoRoute(page: Loginscreen),
    AutoRoute(page: SignUpscreen)


  ],
)
class $AppRouter {}
