import 'package:mobr1/core/core.dart';

import '../../../../core/data/http_client.dart';
import '../../movie.dart';

class LoadMovieDetailImpl implements LoadMovieDetail {
  final HttpClient httpClient;
  final String url;

  LoadMovieDetailImpl({required this.httpClient, required this.url});

  @override
  Future<MovieDetailEntity> call(int id) async {
    try {
      final httpResponse =
          await httpClient.request(url: "$url$id", method: 'get');
      return RemoteMovieModel.fromJson(httpResponse).toEntity();
    } on DomainError catch (error) {
      throw error == DomainError.accessDenied
          ? DomainError.accessDenied
          : DomainError.unexpected;
    }
  }
}
