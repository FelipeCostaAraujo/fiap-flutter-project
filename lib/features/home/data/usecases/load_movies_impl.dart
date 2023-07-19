import 'package:mobr1/core/core.dart';
import 'package:mobr1/features/home/data/models/remote_movie_detail_model.dart';

import '../../../../core/data/http.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/usecases/load_movies.dart';

class LoadMoviesImpl implements LoadMovies {
  final HttpClient httpClient;
  final String url;

  LoadMoviesImpl({required this.httpClient, required this.url});

  @override
  Future<List<MovieEntity>> call() async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');
      return List.generate(
        httpResponse["results"].length,
        (index) =>
            RemoteMovieDetailModel.fromJson(httpResponse["results"][index])
                .toEntity(),
      );
    } on DomainError catch (error) {
      throw error == DomainError.accessDenied
          ? DomainError.accessDenied
          : DomainError.unexpected;
    }
  }
}
