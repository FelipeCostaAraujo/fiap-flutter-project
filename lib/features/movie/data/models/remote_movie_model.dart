import '../../domain/entities/entities.dart';

import './models.dart';

class RemoteMovieModel {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final String status;
  final String releaseDate;
  final List<RemoteGenresModel> genres;
  final List<RemoteProductionCompaniesModel> productionCompanies;

  RemoteMovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.status,
    required this.genres,
    required this.productionCompanies,
  });

  factory RemoteMovieModel.fromJson(Map<String, dynamic> json) {
    return RemoteMovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      status: json['status'],
      genres: json['genres']
          .map<RemoteGenresModel>((json) => RemoteGenresModel.fromJson(json))
          .toList(),
      productionCompanies: json['production_companies']
          .map<RemoteProductionCompaniesModel>(
              (json) => RemoteProductionCompaniesModel.fromJson(json))
          .toList(),
    );
  }

  MovieDetailEntity toEntity() => MovieDetailEntity(
        id: id,
        title: title,
        overview: overview,
        posterPath: posterPath,
        releaseDate: releaseDate,
        status: status,
        genres: genres.map((e) => e.toEntity()).toList(),
        productionCompanies:
            productionCompanies.map((e) => e.toEntity()).toList(),
      );
}
