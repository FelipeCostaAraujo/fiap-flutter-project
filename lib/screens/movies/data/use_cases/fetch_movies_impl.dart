import 'dart:convert';

import 'package:http/http.dart';
import 'package:mobr1/screens/movies/domain/use_cases/fetch_movies.dart';
import 'package:mobr1/screens/movies/domain/utils/domain_errors.dart';

import '../../domain/entities/movie_entity.dart';
import '../models/movie_model.dart';

class FetchMoviesImpl extends FetchMovies {
  @override
  Future<List<MovieEntity>> execute() async {
    try {
      final uri = Uri.parse('https://demo7206081.mockable.io/movies');
      final response = await Client().get(uri);

      switch (response.statusCode) {
        case 200:
          final responseJson = jsonDecode(response.body);
          final moviesListJson = responseJson['results'];

          final moviesList = moviesListJson
              .map<MovieEntity>(
                (movieJson) => MovieModel.fromJson(movieJson).toEntity(),
              )
              .toList();
          return moviesList;
        case 404:
          throw DomainError.notFound;
        case 500:
          throw DomainError.serverError;
        case 408:
          throw DomainError.timeOut;
        default:
          throw DomainError.unexpected;
      }
    } catch (error) {
      throw (error is DomainError) ? error : DomainError.unexpected;
    }
  }
}
