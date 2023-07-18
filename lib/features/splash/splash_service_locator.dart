import 'package:get_it/get_it.dart';

import './splash.dart';

class SplashServiceLocator {
  static GetIt di = GetIt.instance;
  static void setup() {
    di.registerFactory<VerifyUserLoggedIn>(() => VerifyUserLoggedInImpl());
  }
}
