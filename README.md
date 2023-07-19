# Trabalho final flutter
_1MOBR / APLICAÇÕES NATIVAS CROSS-PLATFORM COM FLUTTER / MARCELO PINHEIRO MONTANHER_

## Lista de tarefas
- [ ] (2pts) Tela de Login e Cadastro separadas. O app deve ter uma tela de Splash também, nessa tela deve ser verificado se o usuário já realizou o login, caso já tenha feito o login, redirecionar diretamente para a home da aplicação
- [x] (2pts) Integração com banco de dados do Firebase ou consumo de alguma API (pode ser os dois).
- [x] (1pt) Presença de listagem de informações (ListView)
- [ ] (1pt) Documentação com informações gerais sobre a aplicação, objetivo do projeto, layout, instruções para testar o projeto (se necessário)
- [x] (2pts) Arquitetura: Separação de camadas, utilização do Bloc/Cubit
- [ ] (2pts) Qualidade do app, pontos de vista do usuário final

## Descrição do projeto
- O projeto tem login com o firebase, salver os filmes favoritos e ter informacoes de perfil do usuario,
- Usa a api the movie db para listar os filmes e detalhes dos filmes.
- Precisa de um arquivo dentro de core/utils chamado settings.dart para funcionar o the movie db.

## Descrição do arquivo settings.dart

```dart
class Settings {
  static String movieDbApiKey = "SUA APIKEY";
  static String movieDbBaseUrl = "https://api.themoviedb.org/3";
  static String movieDbImagesUrl = "https://image.tmdb.org/t/p/w500";
  static String movieDbLanguage = "pt-BR";
  static String movieDbRegion = "BR";
  static String movieDbToken = "TOKEN";
}
```

