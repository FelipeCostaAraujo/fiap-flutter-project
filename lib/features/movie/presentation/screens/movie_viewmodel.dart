class MovieViewModel {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final String status;
  final String releaseDate;
  final List<GenresViewModel> genres;
  final List<ProductionCompaniesViewModel> productionCompanies;

  MovieViewModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.status,
    required this.releaseDate,
    required this.genres,
    required this.productionCompanies,
  });
}

class ProductionCompaniesViewModel {
  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  ProductionCompaniesViewModel({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });
}

class GenresViewModel {
  final int id;
  final String name;

  GenresViewModel({
    required this.id,
    required this.name,
  });
}
