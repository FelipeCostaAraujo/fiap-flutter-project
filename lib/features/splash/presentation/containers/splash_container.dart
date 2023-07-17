import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation.dart';

class SplashContainer extends BlocBuilder<SplashCubit, SplashCubitState> {
  static String routeName = '/splash';

  SplashContainer({super.key})
      : super(
    builder: (context, state) {
      return const SplashScreen();
    },
  );
}
