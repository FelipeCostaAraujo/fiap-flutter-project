import 'package:get_it/get_it.dart';
import 'package:mobr1/screens/movies/data/use_cases/fetch_movies_impl.dart';
import 'package:mobr1/screens/movies/domain/use_cases/fetch_movies.dart';

class MoviesServiceLocator {
  static GetIt di = GetIt.instance;

  static void setup() {
    di.registerFactory<FetchMovies>(() => FetchMoviesImpl());
  }
}
