import '../../movie.dart';

class MovieViewModel {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final String status;
  final String releaseDate;
  bool isFavorite;
  final List<GenresViewModel> genres;
  final List<ProductionCompaniesViewModel> productionCompanies;

  MovieViewModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.status,
    required this.releaseDate,
    this.isFavorite = false,
    required this.genres,
    required this.productionCompanies,
  });

  toEntity() {
    return MovieDetailEntity(
      id: id,
      title: title,
      posterPath: posterPath,
      overview: overview,
      status: status,
      releaseDate: releaseDate,
      genres: genres.map((e) => GenresEntity(id: e.id, name: e.name)).toList(),
      productionCompanies: productionCompanies
          .map((e) => ProductionCompaniesEntity(
                id: e.id,
                logoPath: e.logoPath,
                name: e.name,
                originCountry: e.originCountry,
              ))
          .toList(),
    );
  }
}

class ProductionCompaniesViewModel {
  final int id;
  final String? logoPath;
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
