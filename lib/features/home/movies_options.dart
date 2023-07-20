enum MoviesOptions { morePopular, moreRated, moreRecent }

extension MoviesOptionsExtension on MoviesOptions {
  String get description {
    switch (this) {
      case MoviesOptions.morePopular:
        return 'popular';
      case MoviesOptions.moreRated:
        return 'top_rated';
      case MoviesOptions.moreRecent:
        return 'now_playing';
    }
  }
}
