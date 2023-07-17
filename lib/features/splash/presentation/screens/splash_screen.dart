import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../mixins/navigation_manager.dart';
import '../../../features.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash_screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with NavigationManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashCubit, SplashCubitState>(
        listener: (context, state){
          if(state.status == SplashCubitStateStatus.authenticated){
            navigateTo(HomeScreen.routeName, context);
          }
          if(state.status == SplashCubitStateStatus.unauthenticated){
            navigateTo(AuthScreen.routeName, context);
          }
        },
        builder: (context, state) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.deepPurple,
            ),
          );
        }
      )
    );
  }
}
