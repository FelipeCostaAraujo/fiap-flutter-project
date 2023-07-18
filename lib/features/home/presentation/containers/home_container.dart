import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobr1/core/utils/settings.dart';

import '../presentation.dart';

class HomeContainer extends BlocBuilder<HomeCubit, HomeCubitState> {
  static String routeName = '/home';

  HomeContainer({super.key})
      : super(
          builder: (context, state) {
            return HomeScreen(
                moviesList: List<HomeViewModel>.from(
              state.moviesList.map(
                (movie) => HomeViewModel(
                  id: movie.id,
                  title: movie.title,
                  image: Settings.movieDbImagesUrl + movie.posterPath,
                  description: movie.overview,
                ),
              ),
            ));
          },
        );
}
