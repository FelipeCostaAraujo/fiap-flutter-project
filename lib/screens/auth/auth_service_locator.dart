import 'package:get_it/get_it.dart';
import 'package:mobr1/screens/auth/data/usecases/remote_authentication.dart';

import 'domain/usecases/authentication.dart';

class AuthServiceLocator {
  static GetIt di = GetIt.instance;
  static void setup() {
    di.registerFactory<Authentication>(() => RemoteAuthentication());
  }
}
