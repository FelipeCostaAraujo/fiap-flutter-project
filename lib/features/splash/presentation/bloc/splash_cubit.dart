import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobr1/features/features.dart';

import '../../../../core/errors/domain_errors.dart';

class SplashCubit extends Cubit<SplashCubitState> {
  SplashCubit({required this.verifyUser})
      : super(const SplashCubitState(status: SplashCubitStateStatus.loading));

  VerifyUserLoggedIn verifyUser;

  void onInit() async {
    try {
      await verifyUser();
      emit(state.copyWith(status: SplashCubitStateStatus.authenticated));
    } on DomainError catch (e) {
      emit(state.copyWith(
        status: SplashCubitStateStatus.unauthenticated,
        error: e.description,
      ));
    }
  }
}

class SplashCubitProvider extends BlocProvider<SplashCubit> {
  SplashCubitProvider({
    Key? key,
    Widget? child,
  }) : super(
          key: key,
          create: (_) => SplashCubit(
            verifyUser: GetIt.instance<VerifyUserLoggedIn>(),
          )..onInit(),
          child: child,
        );

  static SplashCubit of(BuildContext context) =>
      BlocProvider.of<SplashCubit>(context);
}
