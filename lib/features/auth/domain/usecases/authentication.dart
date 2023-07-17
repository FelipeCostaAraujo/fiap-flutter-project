abstract class Authentication {
  Future<void> execute(AuthenticationParams params);
}

class AuthenticationParams {
  final String email;
  final String password;

  AuthenticationParams({required this.email, required this.password});
}
