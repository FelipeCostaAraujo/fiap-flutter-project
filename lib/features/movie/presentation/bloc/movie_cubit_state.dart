import '../../domain/entities/entities.dart';

enum MovieCubitStateStatus { initial, loading, loaded, error }

class MovieCubitState {
  const MovieCubitState({
    required this.status,
    this.movie,
    this.error,
  });

  final MovieCubitStateStatus status;
  final MovieDetailEntity? movie;
  final String? error;

  MovieCubitState copyWith({
    MovieCubitStateStatus? status,
    MovieDetailEntity? movie,
    String? error,
  }) {
    return MovieCubitState(
      status: status ?? this.status,
      movie: movie,
      error: error ?? this.error,
    );
  }
}
