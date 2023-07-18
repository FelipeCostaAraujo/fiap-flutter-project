import './features/features.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => SplashCubitProvider(
            child: SplashContainer(),
          ),
        );
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => HomeCubitProvider(child: HomeContainer()),
        );

      case AuthScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => AuthCubitProvider(child: AuthContainer()),
        );

      case SignUpScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );

      case '/movies-details':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => Container(),
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('Erro de redirecionamento'),
        ),
      );
    });
  }
}
