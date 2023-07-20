class FavoriteMovieEntity {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final String releaseDate;
  final bool isFavorite;
  final List<String> genres;

  FavoriteMovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
    required this.isFavorite,
    required this.genres,
  });
}
