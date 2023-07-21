import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/components.dart';

import '../../settings.dart';

class SettingsContainer extends BlocBuilder<SettingsCubit, SettingsCubitState> {
  static String routeName = '/settings';

  SettingsContainer({super.key})
      : super(
          builder: (context, state) {
            switch (state.status) {
              case SettingsCubitStateStatus.loading:
                return const DefaultLoadingView();
              case SettingsCubitStateStatus.loaded:
                return SettingsScreen(
                  model: SettingsViewModel(
                    isDarkMode: state.settings!.isDarkMode,
                    isLightMode: state.settings!.isLightMode,
                    isSystemMode: state.settings!.isSystemMode,
                    isNotifications: state.settings!.isNotifications,
                  ),
                );
              case SettingsCubitStateStatus.error:
                return DefaultErrorView(
                  message: state.error!,
                  onTryAgain: () => SettingsCubitProvider.of(context).onInit(),
                );
            }
          },
        );
}
