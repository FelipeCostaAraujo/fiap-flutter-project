import 'package:flutter/material.dart';

import './componets.dart';
import '../home_viewmodel.dart';

class MoviesGridView extends StatelessWidget {
  final List<MovieModel> moviesList;
  const MoviesGridView({required this.moviesList, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.65,
      padding: const EdgeInsets.all(16),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: moviesList
          .map(
            (movie) => MoviesGridCell(movie: movie),
          )
          .toList(),
    );
  }
}
