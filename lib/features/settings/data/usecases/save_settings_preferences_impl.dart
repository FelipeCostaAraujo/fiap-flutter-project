import 'package:mobr1/core/core.dart';
import 'package:mobr1/features/settings/domain/entities/settings_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/usecases/save_settings_preferences.dart';

class SaveSettingsPreferencesImpl implements SaveSettingsPreferences {
  @override
  Future<void> call(SettingsEntity settings) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDarkMode', settings.isDarkMode);
      await prefs.setBool('isNotifications', settings.isNotifications);
      await prefs.setBool('isSystemMode', settings.isSystemMode);
      await prefs.setBool('isLightMode', settings.isLightMode);
    } on DomainError {
      throw DomainError.unexpected;
    }
  }
}
