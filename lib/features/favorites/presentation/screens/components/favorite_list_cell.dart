import 'package:flutter/material.dart';
import 'package:mobr1/features/features.dart';

class FavoriteListCell extends StatelessWidget {
  final FavoritesViewModel movie;
  final Future<void> Function() onDeletedFavorite;
  const FavoriteListCell({
    required this.movie,
    required this.onDeletedFavorite,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MovieScreen.routeName,
            arguments: movie.id);
      },
      child: Material(
        borderRadius: BorderRadius.circular(16),
        elevation: 4,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: Image.network(movie.posterPath),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movie.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDeletedFavorite,
            ),
          ],
        ),
      ),
    );
  }
}