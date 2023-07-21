import 'package:flutter/material.dart';
import 'package:mobr1/features/features.dart';

class FavoriteListCell extends StatefulWidget {
  final FavoritesViewModel movie;
  final Future<void> Function() onDeletedFavorite;
  const FavoriteListCell({
    required this.movie,
    required this.onDeletedFavorite,
    super.key,
  });

  @override
  State<FavoriteListCell> createState() => _FavoriteListCellState();
}

class _FavoriteListCellState extends State<FavoriteListCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, MovieScreen.routeName,
            arguments: widget.movie.id);
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
                child: Image.network(widget.movie.posterPath),
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
                      widget.movie.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    textBuilder("Generos: ", widget.movie.genres.join(", ")),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: widget.onDeletedFavorite,
            ),
          ],
        ),
      ),
    );
  }

  Widget textBuilder(String title, String text) {
    return RichText(
      text: TextSpan(
        text: title,
        style: TextStyle(
          color: Theme.of(context).textTheme.titleSmall?.color,
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(
            text: text,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
