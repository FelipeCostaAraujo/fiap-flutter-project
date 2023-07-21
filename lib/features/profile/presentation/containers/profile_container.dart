import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobr1/core/components/components.dart';
import '../../profile.dart';

class ProfileContainer extends BlocBuilder<ProfileCubit, ProfileCubitState> {
  static String routeName = '/profile';

  ProfileContainer({super.key})
      : super(
          builder: (context, state) {
            switch (state.status) {
              case ProfileCubitStateStatus.loading:
                return const DefaultLoadingView();
              case ProfileCubitStateStatus.loaded:
                return ProfileScreen(
                  profile: ProfileViewModel(
                    name: state.profile!.name,
                    email: state.profile!.email,
                    picture: state.profile?.imageUrl ?? '',
                  ),
                );
              case ProfileCubitStateStatus.error:
                return DefaultErrorView(
                    onTryAgain: () => ProfileCubitProvider.of(context).onInit(),
                    message: state.error!);
            }
          },
        );
}
