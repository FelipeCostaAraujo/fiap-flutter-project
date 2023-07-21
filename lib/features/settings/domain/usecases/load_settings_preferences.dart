import '../entities/entities.dart';

abstract class LoadSettingsPreferences {
  Future<SettingsEntity> call();
}
