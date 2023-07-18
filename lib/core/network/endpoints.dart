class EndPoints {
  static String movies = "/discover/movie";
  static String movieDetails(String movieID) => "/movie/$movieID/";
  static String movieVideos = "/movie/";
  static String movieReviews = "/movie/";
  static String moviesPopular = "/movie/popular";
  static String moviesTopRated = "/movie/top_rated";
}
