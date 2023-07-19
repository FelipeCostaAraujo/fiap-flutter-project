import '../../domain/entities/production_companies_entity.dart';

class RemoteProductionCompaniesModel {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  RemoteProductionCompaniesModel({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory RemoteProductionCompaniesModel.fromJson(Map<String, dynamic> json) {
    return RemoteProductionCompaniesModel(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }

  ProductionCompaniesEntity toEntity() => ProductionCompaniesEntity(
        id: id,
        logoPath: logoPath,
        name: name,
        originCountry: originCountry,
      );
}
