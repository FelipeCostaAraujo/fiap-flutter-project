import '../../domain/entities/entities.dart';

enum FavoritesCubitStateStatus {
  loading,
  loaded,
  error,
}

class FavoritesCubitState {
  const FavoritesCubitState({
    required this.status,
    this.favoritesList = const [],
    this.error,
  });

  final FavoritesCubitStateStatus status;
  final List<FavoriteMovieEntity> favoritesList;
  final String? error;

  FavoritesCubitState copyWith({
    FavoritesCubitStateStatus? status,
    List<FavoriteMovieEntity>? favoritesList,
    String? error,
  }) {
    return FavoritesCubitState(
      status: status ?? this.status,
      favoritesList: favoritesList ?? this.favoritesList,
      error: error ?? this.error,
    );
  }
}
