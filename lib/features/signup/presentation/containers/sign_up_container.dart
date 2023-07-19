import 'package:flutter_bloc/flutter_bloc.dart';
import '../../signup.dart';

class SignUpContainer extends BlocBuilder<SignUpCubit, SignUpCubitState> {
  static String routeName = '/auth';

  SignUpContainer({super.key})
      : super(
          builder: (context, state) {
            return const SignUpScreen();
          },
        );
}
