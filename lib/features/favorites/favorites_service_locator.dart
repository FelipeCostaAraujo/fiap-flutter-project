import 'package:get_it/get_it.dart';

import './favorites.dart';

class FavoritesServiceLocator {
  static GetIt di = GetIt.instance;
  static void setup() {
    di.registerFactory<LoadFavoritesMovies>(() => LoadFavoritesMoviesImpl());
    di.registerFactory<DeleteFavoriteMovie>(() => DeleteFavoriteMovieImpl());
  }
}
