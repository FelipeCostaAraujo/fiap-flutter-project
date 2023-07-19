import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/errors/domain_errors.dart';
import '../../movie.dart';

class MovieCubit extends Cubit<MovieCubitState> {
  MovieCubit({required this.loadMovieDetail})
      : super(
          const MovieCubitState(status: MovieCubitStateStatus.loading),
        );

  LoadMovieDetail loadMovieDetail;

  Future<void> load(int id) async {
    try {
      emit(state.copyWith(status: MovieCubitStateStatus.loading));
      final movie = await loadMovieDetail.call(id);
      emit(state.copyWith(
        status: MovieCubitStateStatus.loaded,
        movie: movie,
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
          )..load(id),
          child: child,
        );

  static MovieCubit of(BuildContext context) =>
      BlocProvider.of<MovieCubit>(context);
}
