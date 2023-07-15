enum DomainError {
  notFound,
  timeOut,
  serverError,
  unexpected;

  String get description {
    switch (this) {
      case DomainError.notFound:
        return 'Url não existe';
      case DomainError.timeOut:
        return 'Tempo de conexão esgotado';
      case DomainError.serverError:
        return 'Falha no servidor';
      default:
        return 'Erro desconhecido';
    }
  }
}