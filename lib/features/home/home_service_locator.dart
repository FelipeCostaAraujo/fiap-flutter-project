import 'package:get_it/get_it.dart';
import 'package:mobr1/core/network/endpoints.dart';
import 'package:mobr1/core/utils/settings.dart';
import 'package:mobr1/features/home/data/usecases/load_movies_impl.dart';
import '../../core/decorators/authorize_http_client_decorator.dart';
import './home.dart';

class HomeServiceLocator {
  static GetIt di = GetIt.instance;
  static void setup() {
    di.registerFactory<LoadMovies>(
      () => LoadMoviesImpl(
        httpClient: AuthorizeHttpClientDecorator(),
        url: Settings.movieDbBaseUrl + EndPoints.movies,
      ),
    );
  }
}
