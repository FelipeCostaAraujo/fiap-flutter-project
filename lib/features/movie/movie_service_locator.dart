import 'package:get_it/get_it.dart';
import 'package:mobr1/core/network/endpoints.dart';
import 'package:mobr1/core/utils/settings.dart';
import '../../core/decorators/authorize_http_client_decorator.dart';
import './movie.dart';

class MovieServiceLocator {
  static GetIt di = GetIt.instance;
  static void setup() {
    di.registerFactory<LoadMovieDetail>(
          () => LoadMovieDetailImpl(
        httpClient: AuthorizeHttpClientDecorator(),
        url: Settings.movieDbBaseUrl + EndPoints.movieDetails,
      ),
    );
  }
}
