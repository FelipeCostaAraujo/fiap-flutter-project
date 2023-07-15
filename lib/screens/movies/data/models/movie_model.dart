import 'package:mobr1/screens/movies/domain/entities/movie_entity.dart';

class MovieModel {
  const MovieModel({
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
    );
  }

  final String title;
  final String overview;
  final String? posterPath;

  MovieEntity toEntity() {
    return MovieEntity(
      title: title,
      overview: overview,
      image: posterPath,
    );
  }
}