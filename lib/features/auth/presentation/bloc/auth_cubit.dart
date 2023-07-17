import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/errors/errors.dart';
import '../../auth.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit({required this.auth})
      : super(
          const AuthCubitState(
            status: AuthCubitStateStatus.initial,
          ),
        );

  Authentication auth;

  Future signIn(String email, String password) async {
    try {
      emit(state.copyWith(status: AuthCubitStateStatus.loading));
      await auth
          .execute(AuthenticationParams(email: email, password: password));
      emit(state.copyWith(status: AuthCubitStateStatus.authenticated));
    } on DomainError catch (e) {
      emit(state.copyWith(
        status: AuthCubitStateStatus.error,
        error: e.description,
      ));
    } finally {
      emit(state.copyWith(status: AuthCubitStateStatus.loaded));
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
          child: child,
        );

  static AuthCubit of(BuildContext context) =>
      BlocProvider.of<AuthCubit>(context);
}
