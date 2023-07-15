import '../../domain/entities/movie_entity.dart';

enum MoviesCubitStateStatus { loading, loaded, error }

class MoviesCubitState {
  const MoviesCubitState({
    required this.status,
    this.moviesList = const [],
    this.error,
  });

  final MoviesCubitStateStatus status;
  final List<MovieEntity> moviesList;
  final String? error;

  MoviesCubitState copyWith({
    MoviesCubitStateStatus? status,
    List<MovieEntity>? moviesList,
    String? error,
  }) {
    return MoviesCubitState(
      status: status ?? this.status,
      moviesList: moviesList ?? this.moviesList,
      error: error ?? this.error,
    );
  }
}