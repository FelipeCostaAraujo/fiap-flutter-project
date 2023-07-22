import '../../../../core/data/http/http.dart';
import '../../domain/entities/movie_entity.dart';

class RemoteMovieDetailModel {
  final int id;
  final String title;
  final String posterPath;
  final String overview;

  RemoteMovieDetailModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory RemoteMovieDetailModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'title'])) {
      throw HttpError.invalidData;
    }
    return RemoteMovieDetailModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      overview: json['overview'],
    );
  }

  toEntity() => MovieEntity(
        id: id,
        title: title,
        posterPath: posterPath,
        overview: overview,
      );
}
