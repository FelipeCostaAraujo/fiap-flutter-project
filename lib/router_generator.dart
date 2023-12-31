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
          builder: (_) => SignUpCubitProvider(child: SignUpContainer()),
        );

      case MovieScreen.routeName:
        if (args is int) {
          return MaterialPageRoute(
            builder: (_) => MovieCubitProvider(
              id: args,
              child: MovieContainer(id: args),
            ),
          );
        }
        return _errorRoute();

      case FavoritesScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => FavoritesCubitProvider(child: FavoritesContainer()),
        );

      case SettingsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => SettingsCubitProvider(child: SettingsContainer()),
        );

      case ProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ProfileCubitProvider(child: ProfileContainer()),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('Erro de redirecionamento'),
        ),
      );
    });
  }
}
