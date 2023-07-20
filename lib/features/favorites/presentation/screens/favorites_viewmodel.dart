import '../../favorites.dart';

class FavoritesViewModel {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final String releaseDate;
  final bool isFavorite;

  FavoritesViewModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
    required this.isFavorite,
  });

  toEntity() {
    return FavoriteMovieEntity(
      id: id,
      title: title,
      posterPath: posterPath,
      overview: overview,
      releaseDate: releaseDate,
      isFavorite: isFavorite,
    );
  }
}
