import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/errors/errors.dart';
import '../../../profile/profile.dart';
import '../../home.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit({required this.loadMovies, required this.loadProfile})
      : super(
          const HomeCubitState(
            status: HomeCubitStateStatus.loading,
          ),
        );

  LoadMovies loadMovies;
  LoadProfile loadProfile;

  void onInit() async {
    try {
      final moviesList = await loadMovies.call();
      final profile = await loadProfile.call();

      emit(state.copyWith(
        status: HomeCubitStateStatus.loaded,
        moviesList: moviesList,
        userName: profile.name,
        userImage: profile.imageUrl,
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

  Future<void> loadMoviesByOptions(MoviesOptions options) async {
    try {
      final moviesList = await loadMovies.call(options: options);

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
            loadProfile: GetIt.instance<LoadProfile>(),
            loadMovies: GetIt.instance<LoadMovies>(),
          )..onInit(),
          child: child,
        );

  static HomeCubit of(BuildContext context) =>
      BlocProvider.of<HomeCubit>(context);
}
