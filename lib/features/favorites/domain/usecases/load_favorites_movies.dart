import '../entities/entities.dart';

abstract class LoadFavoritesMovies {
  Future<List<FavoriteMovieEntity>> call();
}
