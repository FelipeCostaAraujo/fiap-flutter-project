import 'package:get_it/get_it.dart';

import './auth.dart';

class AuthServiceLocator {
  static GetIt di = GetIt.instance;
  static void setup() {
    di.registerFactory<Authentication>(() => RemoteAuthentication());
  }
}
