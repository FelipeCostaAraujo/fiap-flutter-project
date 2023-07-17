enum SplashCubitStateStatus { loading, authenticated, unauthenticated }

class SplashCubitState {
  const SplashCubitState({
    required this.status,
    this.error,
  });

  final SplashCubitStateStatus status;
  final String? error;

  SplashCubitState copyWith({
    SplashCubitStateStatus? status,
    String? error,
  }) {
    return SplashCubitState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
