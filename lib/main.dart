import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:mobr1/features/features.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './router_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  ///Setup Service Locators
  AuthServiceLocator.setup();
  SplashServiceLocator.setup();
  HomeServiceLocator.setup();
  MovieServiceLocator.setup();
  SignUpServiceLocator.setup();
  FavoritesServiceLocator.setup();
  SettingsServiceLocator.setup();
  ProfileServiceLocator.setup();

  runApp(const MyApp());
}

const routes = RouteGenerator.generateRoute;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  T? cast<T>(x) => x is T ? x : null;
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

  themeModeChange() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var isDarkMode = prefs.getBool('isDarkMode');
    var isSystemMode = prefs.getBool('isSystemMode');
    var isLightMode = prefs.getBool('isLightMode');

    if (isSystemMode == true) {
      _notifier.value = ThemeMode.system;
    } else if (isDarkMode == true) {
      _notifier.value = ThemeMode.dark;
    } else if (isLightMode == true) {
      _notifier.value = ThemeMode.light;
    } else {
      _notifier.value = ThemeMode.light;
    }
  }

  @override
  Widget build(BuildContext context) {
    themeModeChange();
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _notifier,
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: value,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: routes,
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
      },
    );
  }
}
