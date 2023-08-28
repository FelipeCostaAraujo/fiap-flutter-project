import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/errors/domain_errors.dart';
import '../../profile.dart';

class ProfileCubit extends Cubit<ProfileCubitState> {
  ProfileCubit({required this.loadProfile, required this.saveProfile})
      : super(
          const ProfileCubitState(status: ProfileCubitStateStatus.loading),
        );

  LoadProfile loadProfile;
  SaveProfile saveProfile;

  void onInit() async {
    try {
      final profile = await loadProfile.call();
      emit(state.copyWith(
        status: ProfileCubitStateStatus.loaded,
        profile: profile,
      ));
    } on DomainError catch (error) {
      emit(state.copyWith(
        status: ProfileCubitStateStatus.error,
        error: error.description,
      ));
    }
  }

  Future<void> saveProfileData(ProfileEntity profileEntity) async {
    try {
      await saveProfile.call(profileEntity);
      emit(state.copyWith(
        status: ProfileCubitStateStatus.loaded,
        profile: profileEntity,
      ));
    } on DomainError catch (error) {
      emit(
        state.copyWith(
          status: ProfileCubitStateStatus.error,
          error: error.description,
        ),
      );
    }
  }
}

class ProfileCubitProvider extends BlocProvider<ProfileCubit> {
  ProfileCubitProvider({
    Key? key,
    Widget? child,
  }) : super(
          key: key,
          create: (_) => ProfileCubit(
              saveProfile: GetIt.instance<SaveProfile>(),
              loadProfile: GetIt.instance<LoadProfile>())
            ..onInit(),
          child: child,
        );

  static ProfileCubit of(BuildContext context) =>
      BlocProvider.of<ProfileCubit>(context);
}
