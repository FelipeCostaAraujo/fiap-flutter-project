import '../../domain/entities/entities.dart';

enum ProfileCubitStateStatus { loading, loaded, error }

class ProfileCubitState {
  const ProfileCubitState({
    required this.status,
    this.profile,
    this.error,
  });

  final ProfileCubitStateStatus status;
  final ProfileEntity? profile;
  final String? error;

  ProfileCubitState copyWith({
    ProfileCubitStateStatus? status,
    ProfileEntity? profile,
    String? error,
  }) {
    return ProfileCubitState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
      error: error ?? this.error,
    );
  }
}
