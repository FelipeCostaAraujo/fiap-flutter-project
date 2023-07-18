import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/errors/errors.dart';
import '../../home.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit({required this.loadMovies})
      : super(
          const HomeCubitState(
            status: HomeCubitStateStatus.loading,
          ),
        );

  LoadMovies loadMovies;

  void onInit() async {
    try {
      final moviesList = await loadMovies.call();
      await Future.delayed(Duration(seconds: 3));

      emit(state.copyWith(
        status: HomeCubitStateStatus.loaded,
        moviesList: moviesList,
      ));
    } on DomainError catch (error) {
      emit(
        state.copyWith(
          status: HomeCubitStateStatus.error,
          error: error.description,
        ),
      );
    }
  }
}

class HomeCubitProvider extends BlocProvider<HomeCubit> {
  HomeCubitProvider({
    Key? key,
    Widget? child,
  }) : super(
          key: key,
          create: (_) => HomeCubit(
            loadMovies: GetIt.instance<LoadMovies>(),
          )..onInit(),
          child: child,
        );

  static HomeCubit of(BuildContext context) =>
      BlocProvider.of<HomeCubit>(context);
}
