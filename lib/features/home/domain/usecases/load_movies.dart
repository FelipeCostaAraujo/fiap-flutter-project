import '../../home.dart';

import '../entities/movie_entity.dart';

abstract class LoadMovies {
  Future<List<MovieEntity>> call({
    MoviesOptions options = MoviesOptions.moreRecent,
  });
}
