import '../../domain/entities/movie_entity.dart';

enum HomeCubitStateStatus { initial, loading, loaded, error }

class HomeCubitState {
  const HomeCubitState({
    required this.status,
    this.userName,
    this.userImage,
    this.moviesList = const [],
    this.error,
  });

  final HomeCubitStateStatus status;
  final List<MovieEntity> moviesList;
  final String? userName;
  final String? userImage;
  final String? error;

  HomeCubitState copyWith({
    HomeCubitStateStatus? status,
    List<MovieEntity>? moviesList,
    String? userName,
    String? userImage,
    String? error,
  }) {
    return HomeCubitState(
      status: status ?? this.status,
      moviesList: moviesList ?? this.moviesList,
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      error: error ?? this.error,
    );
  }
}
