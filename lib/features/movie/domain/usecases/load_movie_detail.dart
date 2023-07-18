import '../entities/entities.dart';

abstract class LoadMovieDetail {
  Future<MovieDetailEntity> call(int id);
}
