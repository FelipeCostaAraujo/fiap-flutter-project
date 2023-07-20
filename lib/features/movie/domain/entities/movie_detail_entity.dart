import 'package:mobr1/features/movie/domain/entities/entities.dart';

class MovieDetailEntity {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final String status;
  final String releaseDate;
  bool isFavorite;
  final List<GenresEntity> genres;
  final List<ProductionCompaniesEntity> productionCompanies;

  MovieDetailEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.status,
    required this.releaseDate,
    this.isFavorite = false,
    required this.genres,
    required this.productionCompanies,
  });
}
