import 'package:mobr1/features/settings/domain/entities/entities.dart';

class SettingsViewModel {
  bool isDarkMode;
  bool isLightMode;
  bool isSystemMode;
  bool isNotifications;

  SettingsViewModel({
    required this.isDarkMode,
    required this.isLightMode,
    required this.isSystemMode,
    required this.isNotifications,
  });

  toEntity() => SettingsEntity(
        isDarkMode: isDarkMode,
        isLightMode: isLightMode,
        isSystemMode: isSystemMode,
        isNotifications: isNotifications,
      );
}
