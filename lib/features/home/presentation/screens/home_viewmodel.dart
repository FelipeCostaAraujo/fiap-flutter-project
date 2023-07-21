class HomeViewModel {
  final String userName;
  final String userImage;
  final List<MovieModel> movies;

  HomeViewModel({
    required this.userName,
    required this.userImage,
    required this.movies,
  });
}

class MovieModel {
  final int id;
  final String title;
  final String image;
  final String description;

  MovieModel({
    required this.image,
    required this.title,
    required this.id,
    required this.description,
  });
}
