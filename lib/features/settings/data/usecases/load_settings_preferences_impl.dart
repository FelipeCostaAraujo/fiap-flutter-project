import 'package:mobr1/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';

class LoadSettingsPreferencesImpl implements LoadSettingsPreferences {
  @override
  Future<SettingsEntity> call() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var isDarkMode = prefs.getBool('isDarkMode');
      var isNotifications = prefs.getBool('isNotifications');
      var isSystemMode = prefs.getBool('isSystemMode');
      var isLightMode = prefs.getBool('isLightMode');

      return SettingsEntity(
        isDarkMode: isDarkMode ?? false,
        isNotifications: isNotifications ?? false,
        isSystemMode: isSystemMode ?? false,
        isLightMode: isLightMode ?? false,
      );
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
