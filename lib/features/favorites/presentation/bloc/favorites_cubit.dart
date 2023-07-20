import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/core.dart';
import '../../favorites.dart';

class FavoritesCubit extends Cubit<FavoritesCubitState> {
  FavoritesCubit({
    required this.loadFavoritesMovies,
    required this.deleteFavoriteMovie,
  }) : super(
          const FavoritesCubitState(
            status: FavoritesCubitStateStatus.loading,
          ),
        );

  LoadFavoritesMovies loadFavoritesMovies;
  DeleteFavoriteMovie deleteFavoriteMovie;

  void onInit() async {
    try {
      final favoritesList = await loadFavoritesMovies.call();

      emit(state.copyWith(
        status: FavoritesCubitStateStatus.loaded,
        favoritesList: favoritesList,
      ));
    } on DomainError catch (error) {
      emit(
        state.copyWith(
          status: FavoritesCubitStateStatus.error,
          error: error.description,
        ),
      );
    }
  }

  Future<void> onRemoveFavoriteMovie({
    required FavoriteMovieEntity movie,
  }) async {
    try {
      await deleteFavoriteMovie.call(movie.id);
      final favoritesList = await loadFavoritesMovies.call();

      emit(state.copyWith(
        status: FavoritesCubitStateStatus.loaded,
        favoritesList: favoritesList,
      ));
    } on DomainError catch (error) {
      emit(
        state.copyWith(
          status: FavoritesCubitStateStatus.error,
          error: error.description,
        ),
      );
    }
  }
}

class FavoritesCubitProvider extends BlocProvider<FavoritesCubit> {
  FavoritesCubitProvider({
    Key? key,
    Widget? child,
  }) : super(
          key: key,
          create: (_) => FavoritesCubit(
              deleteFavoriteMovie: GetIt.instance<DeleteFavoriteMovie>(),
              loadFavoritesMovies: GetIt.instance<LoadFavoritesMovies>())
            ..onInit(),
          child: child,
        );

  static FavoritesCubit of(BuildContext context) =>
      BlocProvider.of<FavoritesCubit>(context);
}
