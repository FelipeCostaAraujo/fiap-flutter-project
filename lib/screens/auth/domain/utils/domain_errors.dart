enum DomainError {
  invalidCredentials,
  timeOut,
  serverError,
  unexpected;

  String get description {
    switch (this) {
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
