import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_cubit.dart';
import '../bloc/auth_cubit_state.dart';
import '../screens/auth_screen.dart';

class AuthContainer extends BlocBuilder<AuthCubit,AuthCubitState> {
  static String routeName = '/auth';

  AuthContainer({super.key})
   : super(
     builder: (context, state) {
       return const AuthScreen();
     },
   );
}