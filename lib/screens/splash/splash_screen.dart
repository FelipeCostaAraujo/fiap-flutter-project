import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../mixins/navigation_manager.dart';
import '../screens.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash_screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with NavigationManager{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: verifyUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Future<void> verifyUser() async {
    await Future.delayed(const Duration(seconds: 3));
    final user = FirebaseAuth.instance.currentUser;
    if (context.mounted) {
      if (user != null) {
        navigateTo(MenuScreen.routeName, context);
      } else {
        navigateTo(AuthScreen.routeName, context);
      }
    }
  }
}
