import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobr1/core/utils/settings.dart';

import '../../../../core/components/components.dart';
import '../presentation.dart';

class MovieContainer extends BlocBuilder<MovieCubit, MovieCubitState> {
  static String routeName = '/home';

  MovieContainer({super.key})
      : super(
          builder: (context, state) {
            if (state.status == MovieCubitStateStatus.loading &&
                state.movie == null) {
              return const DefaultLoadingView();
            } else {
              return MovieScreen(
                model: MovieViewModel(
                  id: state.movie!.id,
                  title: state.movie!.title,
                  overview: state.movie!.overview,
                  status: state.movie!.status,
                  posterPath:Settings.movieDbImagesUrl + state.movie!.posterPath,
                  releaseDate: state.movie!.releaseDate,
                  productionCompanies: state.movie!.productionCompanies
                      .map(
                        (e) => ProductionCompaniesViewModel(
                          id: e.id,
                          logoPath: e.logoPath,
                          name: e.name,
                          originCountry: e.originCountry,
                        ),
                      )
                      .toList(),
                  genres: state.movie!.genres
                      .map(
                        (e) => GenresViewModel(id: e.id, name: e.name),
                      )
                      .toList(),
                ),
              );
            }
          },
        );
}
