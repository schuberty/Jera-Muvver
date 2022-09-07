import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/home/presentation/pages/home_page.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/pages/passenger_package_type_page.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/pages/passenger_page.dart';
import 'package:jera_muvver/src/modules/passenger/presentation/pages/passenger_path_page.dart';
import 'package:jera_muvver/src/shared/app/route/route_animator.dart';

class AppRouter {
  static Route<void>? onGenerateRoutes(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;

    switch (routeSettings.name) {
      case '/':
        return _homePage();
      case '/passenger':
        return MaterialPageRoute(builder: (_) => const PassengerPage());
      case '/passenger/path':
        return RouteAnimator.rightToLeftRoute(const PassengerPathPage());
      case '/passenger/package/type':
        return RouteAnimator.rightToLeftRoute(const PassengerPackageTypePage());
      default:
        return _homePage();
    }
  }

  static MaterialPageRoute _homePage() {
    return MaterialPageRoute(
      builder: (_) => const HomePage(),
    );
  }
}
