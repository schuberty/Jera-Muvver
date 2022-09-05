import 'package:flutter/material.dart';
import 'package:jera_muvver/src/modules/home/presentation/pages/home_page.dart';

class AppRouter {
  static Route<void>? onGenerateRoutes(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;

    switch (routeSettings.name) {
      case '/':
      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
