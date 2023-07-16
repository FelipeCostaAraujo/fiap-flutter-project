import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:mobr1/screens/screens.dart';
import 'package:mobr1/screens/movies/presentation/containers/movies_container.dart';

import 'screens/movies/presentation/bloc/movies_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  MoviesServiceLocator.setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  T? cast<T>(x) => x is T ? x : null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SplashScreen.routeName: (_) => const SplashScreen(),
        AuthScreen.routeName: (_) => const AuthScreen(),
        SignUpScreen.routeName: (_) => const SignUpScreen(),
        MenuScreen.routeName: (_) => const MenuScreen(),
        PersonalCardScreen.routeName: (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments
              as PersonalCardScreenParams;
          return PersonalCardScreen(
            params: arguments,
          );
        },
        DiceScreen.routeName: (_) => const DiceScreen(),
        QuizScreen.routeName: (_) => const QuizScreen(),
        QuizFinishedScreen.routeName: (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments
              as QuizFinishedScreenParams;
          return QuizFinishedScreen(
            params: arguments,
          );
        },
        MoviesContainer.routeName: (_) =>
            MoviesCubitProvider(child: MoviesContainer()),
      },
    );
  }
}
