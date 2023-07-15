import '../entities/movie_entity.dart';

abstract class FetchMovies {
  Future<List<MovieEntity>> execute();
}