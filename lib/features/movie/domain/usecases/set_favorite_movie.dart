import '../entities/entities.dart';

abstract class SetFavoriteMovie {
  Future<void> call({
    required MovieDetailEntity movie,
    required bool isFavorite,
  });
}
