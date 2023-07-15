class MovieEntity {
  const MovieEntity({
    required this.title,
    required this.overview,
    required this.image,
  });

  final String title;
  final String overview;
  final String? image;
}