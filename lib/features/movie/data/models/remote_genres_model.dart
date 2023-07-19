import 'package:mobr1/features/movie/domain/entities/entities.dart';

class RemoteGenresModel {
  final int id;
  final String name;

  RemoteGenresModel({
    required this.id,
    required this.name,
  });

  factory RemoteGenresModel.fromJson(Map<String, dynamic> json) {
    return RemoteGenresModel(
      id: json['id'],
      name: json['name'],
    );
  }

  GenresEntity toEntity() => GenresEntity(
        id: id,
        name: name,
      );
}
