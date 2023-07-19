enum SignUpCubitStateStatus { initial, loading, loaded, success, error }

class SignUpCubitState {
  const SignUpCubitState({
    required this.status,
    this.error,
  });

  final SignUpCubitStateStatus status;
  final String? error;

  SignUpCubitState copyWith({
    SignUpCubitStateStatus? status,
    String? error,
  }) {
    return SignUpCubitState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
