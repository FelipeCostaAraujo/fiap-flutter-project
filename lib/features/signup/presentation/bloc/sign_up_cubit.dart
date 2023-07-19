import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/errors/errors.dart';
import '../../signup.dart';

class SignUpCubit extends Cubit<SignUpCubitState> {
  SignUpCubit({required this.signUp})
      : super(
          const SignUpCubitState(
            status: SignUpCubitStateStatus.initial,
          ),
        );

  SignUp signUp;

  Future register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      emit(state.copyWith(status: SignUpCubitStateStatus.loading));
      await signUp.execute(
        SignUpParams(email: email, password: password, name: name),
      );
      emit(state.copyWith(status: SignUpCubitStateStatus.success));
    } on DomainError catch (e) {
      emit(state.copyWith(
        status: SignUpCubitStateStatus.error,
        error: e.description,
      ));
    } finally {
      emit(state.copyWith(status: SignUpCubitStateStatus.loaded));
    }
  }
}

class SignUpCubitProvider extends BlocProvider<SignUpCubit> {
  SignUpCubitProvider({
    Key? key,
    Widget? child,
  }) : super(
          key: key,
          create: (_) => SignUpCubit(signUp: GetIt.instance<SignUp>()),
          child: child,
        );

  static SignUpCubit of(BuildContext context) =>
      BlocProvider.of<SignUpCubit>(context);
}
