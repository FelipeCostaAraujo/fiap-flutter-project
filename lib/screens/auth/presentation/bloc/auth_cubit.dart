import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobr1/screens/auth/domain/usecases/authentication.dart';

import 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit({required this.auth})
      : super(
          const AuthCubitState(
            status: AuthCubitStateStatus.loading,
          ),
        );

  Authentication auth;

  loginWithCredentials(String email, String password) async {
    emit(state.copyWith(status: AuthCubitStateStatus.loading));
    try {
      await auth
          .execute(AuthenticationParams(email: email, password: password));
      emit(state.copyWith(status: AuthCubitStateStatus.none));
    } on Exception {
      emit(state.copyWith(status: AuthCubitStateStatus.none));
    }
  }
}

class AuthCubitProvider extends BlocProvider<AuthCubit> {
  AuthCubitProvider({
    Key? key,
    Widget? child,
  }) : super(
            key: key,
            create: (_) => AuthCubit(auth: GetIt.instance<Authentication>()),
            child: child);

  static AuthCubit of(BuildContext context) =>
      BlocProvider.of<AuthCubit>(context);
}
