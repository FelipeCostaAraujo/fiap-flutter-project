import 'package:get_it/get_it.dart';
import 'package:mobr1/features/settings/data/usecases/save_settings_preferences_impl.dart';

import './settings.dart';

class SettingsServiceLocator {
  static GetIt di = GetIt.instance;
  static void setup() {
    di.registerFactory<LoadSettingsPreferences>(
      () => LoadSettingsPreferencesImpl(),
    );
    di.registerFactory<SaveSettingsPreferences>(
      () => SaveSettingsPreferencesImpl(),
    );
  }
}
