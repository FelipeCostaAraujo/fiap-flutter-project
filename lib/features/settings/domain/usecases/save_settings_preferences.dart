import '../entities/entities.dart';

abstract class SaveSettingsPreferences {
  Future<void> call(SettingsEntity settings);
}
