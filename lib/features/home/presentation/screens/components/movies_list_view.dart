import 'package:flutter/material.dart';

import './componets.dart';
import '../home_viewmodel.dart';

class MoviesListView extends StatelessWidget {
  final List<HomeViewModel> moviesList;
  const MoviesListView({required this.moviesList,super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: moviesList.length,
      padding: const EdgeInsets.all(16),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final movie = moviesList[index];
        return MoviesListCell(
          movie: movie,
        );
      },
    );
  }
}
