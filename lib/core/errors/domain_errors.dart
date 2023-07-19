enum DomainError {
  invalidCredentials,
  timeOut,
  serverError,
  unexpected,
  userNotFound,
  emailInUse,
  emailInvalid,
  accessDenied;

  String get description {
    switch (this) {
      case DomainError.emailInUse:
        return 'Email já cadastrado';
      case DomainError.emailInvalid:
        return 'Email inválido';
      case DomainError.userNotFound:
        return 'Usuário não encontrado';
      case DomainError.invalidCredentials:
        return 'Crendenciais inválidas';
      case DomainError.timeOut:
        return 'Tempo de conexão esgotado';
      case DomainError.serverError:
        return 'Falha no servidor';
      default:
        return 'Erro desconhecido';
    }
  }
}
