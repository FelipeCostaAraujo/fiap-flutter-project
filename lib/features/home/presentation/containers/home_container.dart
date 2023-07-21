import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobr1/core/utils/settings.dart';

import '../presentation.dart';

class HomeContainer extends BlocBuilder<HomeCubit, HomeCubitState> {
  static String routeName = '/home';

  HomeContainer({super.key})
      : super(
          builder: (context, state) {
            return HomeScreen(
                model: HomeViewModel(
              userName: state.userName ?? '',
              userImage: state.userImage ?? '',
              movies: List<MovieModel>.from(
                state.moviesList.map(
                  (movie) => MovieModel(
                    id: movie.id,
                    title: movie.title,
                    image: Settings.movieDbImagesUrl + movie.posterPath,
                    description: movie.overview,
                  ),
                ),
              ),
            ));
          },
        );
}
