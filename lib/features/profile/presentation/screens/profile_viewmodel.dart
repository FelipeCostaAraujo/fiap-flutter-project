import '../../domain/entities/profile_entity.dart';

class ProfileViewModel {
  String name;
  String email;
  String picture;

  ProfileViewModel({
    required this.name,
    required this.email,
    required this.picture,
  });

  toEntity() => ProfileEntity(
    name: name,
    email: email,
    imageUrl: picture,
  );
}