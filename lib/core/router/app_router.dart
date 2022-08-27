import 'package:flutter/material.dart';

import '../../ui/screens/home_screen/home_screen.dart';
import '../../utils/constants/strings.dart';
import '../../core/exceptions/route_exception.dart';

class AppRouter {
  AppRouter();
  static const String home = '/';

  const AppRouter._();



  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            title: Strings.homeScreenTitle,
          ),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
