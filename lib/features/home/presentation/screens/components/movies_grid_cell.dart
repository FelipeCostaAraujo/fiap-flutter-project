import 'package:flutter/material.dart';
import '../../../../movie/presentation/screens/movie_screen.dart';
import '../home_viewmodel.dart';

class MoviesGridCell extends StatelessWidget {
  final MovieModel movie;
  const MoviesGridCell({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, MovieScreen.routeName,
              arguments: movie.id);
        },
        child: Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 4,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(movie.image, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
