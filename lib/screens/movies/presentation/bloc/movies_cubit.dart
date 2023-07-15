import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobr1/screens/movies/data/use_cases/fetch_movies_impl.dart';
import 'package:mobr1/screens/movies/domain/use_cases/fetch_movies.dart';
import 'package:mobr1/screens/movies/domain/utils/domain_errors.dart';

import 'movies_cubit_state.dart';

class MoviesCubit extends Cubit<MoviesCubitState> {
  MoviesCubit({
    required this.fetchMovies,
  }) : super(
          const MoviesCubitState(
            status: MoviesCubitStateStatus.loading,
          ),
        );

  FetchMovies fetchMovies;

  void onInit() async {
    try {
      final moviesList = await fetchMovies.execute();

      emit(state.copyWith(
        status: MoviesCubitStateStatus.loaded,
        moviesList: moviesList,
      ));
    } on DomainError catch (error) {
      emit(
        state.copyWith(
          status: MoviesCubitStateStatus.error,
          error: error.description,
        ),
      );
    }
  }
}

class MoviesCubitProvider extends BlocProvider<MoviesCubit> {
  MoviesCubitProvider({
    Key? key,
    Widget? child,
  }) : super(
          key: key,
          create: (_) => MoviesCubit(
            fetchMovies: GetIt.instance<FetchMovies>(),
          )..onInit(),
          child: child,
        );

  static MoviesCubit of(BuildContext context) =>
      BlocProvider.of<MoviesCubit>(context);
}
