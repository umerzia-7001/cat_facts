import 'package:flutter/material.dart';
import 'package:proarea_assignment/ui/home/screen/history.dart';
import 'package:proarea_assignment/ui/home/screen/home.dart';
import 'package:proarea_assignment/ui/splash/screen/splash_screen.dart';

mixin RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //Todo: Change when home screen is created

      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case HistoryScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const HistoryScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(child: Text('No route defined')),
      );
    });
  }
}
