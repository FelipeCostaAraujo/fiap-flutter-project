import 'package:get_it/get_it.dart';
import './profile.dart';

class ProfileServiceLocator {
  static GetIt di = GetIt.instance;
  static void setup() {
    di.registerFactory<LoadProfile>(() => LoadProfileImpl());
    di.registerFactory<SaveProfile>(() => SaveProfileImpl());
  }
}
