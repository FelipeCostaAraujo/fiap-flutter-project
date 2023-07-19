import 'package:get_it/get_it.dart';

import './signup.dart';

class SignUpServiceLocator {
  static GetIt di = GetIt.instance;
  static void setup() {
    di.registerFactory<SignUp>(() => SignUpImpl());
  }
}
