class ProductionCompaniesEntity {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompaniesEntity({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  toJson() {
    return {
      'id': id,
      'logo_path': logoPath,
      'name': name,
      'origin_country': originCountry,
    };
  }
}
