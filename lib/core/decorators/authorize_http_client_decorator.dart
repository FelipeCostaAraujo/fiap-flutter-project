import 'package:mobr1/core/utils/settings.dart';

import '../data/http_client.dart';
import '../data/http_error.dart';
import '../infra/http_adapter.dart';

class AuthorizeHttpClientDecorator implements HttpClient {
  final HttpClient decoratee = HttpAdapter();

  @override
  Future<dynamic> request({
    required String url,
    required String method,
    Map? body,
    Map? headers,
  }) async {
    try {
      final token = Settings.movieDbToken;
      final authorizedHeaders = headers ?? {}
        ..addAll({'Authorization': "Bearer $token"});
      return await decoratee.request(
          url: url, method: method, body: body, headers: authorizedHeaders);
    } catch (error) {
      if (error is HttpError && error != HttpError.forbidden) {
        rethrow;
      } else {
        throw HttpError.forbidden;
      }
    }
  }
}
