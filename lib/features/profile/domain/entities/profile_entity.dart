class ProfileEntity {
  final String name;
  final String email;
  final String? imageUrl;

  ProfileEntity({
    required this.name,
    required this.email,
    this.imageUrl,
  });

}