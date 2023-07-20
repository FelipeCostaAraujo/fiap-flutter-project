import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/components.dart';

import '../../../features.dart';

class FavoritesContainer
    extends BlocBuilder<FavoritesCubit, FavoritesCubitState> {
  static String routeName = '/auth';

  FavoritesContainer({super.key})
      : super(
          builder: (context, state) {
            switch (state.status) {
              case FavoritesCubitStateStatus.loading:
                return const DefaultLoadingView();
              case FavoritesCubitStateStatus.loaded:
                return FavoritesScreen(
                  favoritesList: state.favoritesList
                      .map(
                        (favorite) => FavoritesViewModel(
                          id: favorite.id,
                          title: favorite.title,
                          releaseDate: favorite.releaseDate,
                          isFavorite: favorite.isFavorite,
                          posterPath: favorite.posterPath,
                          overview: favorite.overview,
                          genres: favorite.genres,
                        ),
                      )
                      .toList(),
                );
              case FavoritesCubitStateStatus.error:
                return DefaultErrorView(
                  message: state.error!,
                  onTryAgain: () => FavoritesCubitProvider.of(context).onInit(),
                );
            }
          },
        );
}
