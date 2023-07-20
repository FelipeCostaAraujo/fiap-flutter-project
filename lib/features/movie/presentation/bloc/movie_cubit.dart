import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/errors/domain_errors.dart';
import '../../movie.dart';

class MovieCubit extends Cubit<MovieCubitState> {
  MovieCubit({
    required this.loadMovieDetail,
    required this.setFavoriteMovie,
    required this.listIdsFavoritesMovies,
  }) : super(
          const MovieCubitState(status: MovieCubitStateStatus.loading),
        );

  LoadMovieDetail loadMovieDetail;
  SetFavoriteMovie setFavoriteMovie;
  VerifyMovieIsFavorite listIdsFavoritesMovies;

  Future<void> load(int id) async {
    try {
      emit(state.copyWith(status: MovieCubitStateStatus.loading));
      final movie = await loadMovieDetail.call(id);
      final newMovie = await listFavorites(movie);
      emit(state.copyWith(
        status: MovieCubitStateStatus.loaded,
        movie: newMovie,
      ));
    } on DomainError catch (error) {
      emit(
        state.copyWith(
          status: MovieCubitStateStatus.error,
          error: error.description,
        ),
      );
    }
  }

  Future<void> onSetFavoriteMovie({
    bool isFavorite = false,
    required MovieDetailEntity movie,
  }) async {
    try {
      await setFavoriteMovie.call(movie: movie, isFavorite: isFavorite);
    } on DomainError catch (error) {
      emit(
        state.copyWith(
          status: MovieCubitStateStatus.error,
          error: error.description,
        ),
      );
    }
  }

  Future<MovieDetailEntity> listFavorites(MovieDetailEntity movie) async {
    try {
      final isFavorite =
          await listIdsFavoritesMovies.call(id: movie.id.toString());
      movie.isFavorite = isFavorite;
      return movie;
    } catch (error) {
      return movie;
    }
  }
}

class MovieCubitProvider extends BlocProvider<MovieCubit> {
  MovieCubitProvider({
    Key? key,
    Widget? child,
    required int id,
  }) : super(
          key: key,
          create: (_) => MovieCubit(
            loadMovieDetail: GetIt.instance<LoadMovieDetail>(),
            setFavoriteMovie: GetIt.instance<SetFavoriteMovie>(),
            listIdsFavoritesMovies: GetIt.instance<VerifyMovieIsFavorite>(),
          )..load(id),
          child: child,
        );

  static MovieCubit of(BuildContext context) =>
      BlocProvider.of<MovieCubit>(context);
}
