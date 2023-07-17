enum AuthCubitStateStatus { initial, loading, loaded, authenticated, error }

class AuthCubitState {
  const AuthCubitState({
    required this.status,
    this.error,
  });

  final AuthCubitStateStatus status;
  final String? error;

  AuthCubitState copyWith({
    AuthCubitStateStatus? status,
    String? error,
  }) {
    return AuthCubitState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
