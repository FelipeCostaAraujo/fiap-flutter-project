import '../../domain/entities/entities.dart';

class RemoteFavoriteMovieModel {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final String releaseDate;
  final bool isFavorite;

  RemoteFavoriteMovieModel(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.overview,
      required this.releaseDate,
      required this.isFavorite});

  factory RemoteFavoriteMovieModel.fromJson(Map<String, dynamic> json) {
    return RemoteFavoriteMovieModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      isFavorite: json['isFavorite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'poster_path': posterPath,
      'overview': overview,
      'release_date': releaseDate,
      'isFavorite': isFavorite,
    };
  }

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
