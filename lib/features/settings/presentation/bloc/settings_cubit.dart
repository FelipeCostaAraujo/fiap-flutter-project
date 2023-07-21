import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobr1/core/core.dart';
import 'package:mobr1/features/features.dart';

class SettingsCubit extends Cubit<SettingsCubitState> {
  SettingsCubit({
    required this.loadSettingsPreferences,
    required this.saveSettingsPreferences,
  }) : super(
          const SettingsCubitState(status: SettingsCubitStateStatus.loading),
        );

  final LoadSettingsPreferences loadSettingsPreferences;
  final SaveSettingsPreferences saveSettingsPreferences;

  Future<void> onInit() async {
    try {
      final settings = await loadSettingsPreferences.call();

      emit(
        state.copyWith(
          status: SettingsCubitStateStatus.loaded,
          settings: settings,
        ),
      );
    } on DomainError catch (error) {
      emit(
        state.copyWith(
          status: SettingsCubitStateStatus.error,
          error: error.description,
        ),
      );
    }
  }

  Future<void> savePreferences(SettingsViewModel settings) async {
    try {
      await saveSettingsPreferences.call(settings.toEntity());
    } on DomainError catch (error) {
      emit(
        state.copyWith(
          status: SettingsCubitStateStatus.error,
          error: error.description,
        ),
      );
    }
  }
}

class SettingsCubitProvider extends BlocProvider<SettingsCubit> {
  SettingsCubitProvider({
    Key? key,
    Widget? child,
  }) : super(
          key: key,
          create: (_) => SettingsCubit(
            saveSettingsPreferences: GetIt.instance<SaveSettingsPreferences>(),
            loadSettingsPreferences: GetIt.instance<LoadSettingsPreferences>(),
          )..onInit(),
          child: child,
        );

  static SettingsCubit of(BuildContext context) =>
      BlocProvider.of<SettingsCubit>(context);
}
