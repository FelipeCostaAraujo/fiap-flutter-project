import 'package:mobr1/features/settings/domain/entities/entities.dart';

enum SettingsCubitStateStatus { loading, loaded, error }

class SettingsCubitState {
  const SettingsCubitState({
    required this.status,
    this.settings,
    this.error,
  });

  final SettingsCubitStateStatus status;
  final SettingsEntity? settings;
  final String? error;

  SettingsCubitState copyWith({
    SettingsCubitStateStatus? status,
    SettingsEntity? settings,
    String? error,
  }) {
    return SettingsCubitState(
      status: status ?? this.status,
      settings: settings,
      error: error ?? this.error,
    );
  }
}
