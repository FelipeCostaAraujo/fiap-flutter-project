import '../../domain/entities/movie_entity.dart';

enum HomeCubitStateStatus { initial, loading, loaded, error }

class HomeCubitState {
  const HomeCubitState({
    required this.status,
    this.moviesList = const [],
    this.error,
  });

  final HomeCubitStateStatus status;
  final List<MovieEntity> moviesList;
  final String? error;

  HomeCubitState copyWith({
    HomeCubitStateStatus? status,
    List<MovieEntity>? moviesList,
    String? error,
  }) {
    return HomeCubitState(
      status: status ?? this.status,
      moviesList: moviesList ?? this.moviesList,
      error: error ?? this.error,
    );
  }
}
