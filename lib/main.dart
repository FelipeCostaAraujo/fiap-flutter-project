import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:mobr1/features/features.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ///Setup the [AuthServiceLocator] to use the [FirebaseAuthService]
  AuthServiceLocator.setup();
  SplashServiceLocator.setup();

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
        SplashScreen.routeName: (_) => SplashCubitProvider(child:  SplashContainer()),
        AuthScreen.routeName: (_) => AuthCubitProvider(child: AuthContainer()),
        SignUpScreen.routeName: (_) => const SignUpScreen(),
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
    );
  }
}
