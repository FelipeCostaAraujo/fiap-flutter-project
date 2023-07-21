import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobr1/features/movie/movie.dart';

class MovieScreen extends StatefulWidget {
  static const String routeName = '/movie_detail';
  final MovieViewModel model;
  const MovieScreen({required this.model, Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Detalhes do filme",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: widget.model.isFavorite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
            onPressed: () {
              setState(() {
                widget.model.isFavorite = !widget.model.isFavorite;
              });
              context.read<MovieCubit>().onSetFavoriteMovie(
                    movie: widget.model.toEntity(),
                    isFavorite: widget.model.isFavorite,
                  );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                widget.model.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: MediaQuery.of(context).size.height * 0.4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(widget.model.posterPath),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textBuilder(
                    title: "Sinopse: ",
                    text: widget.model.overview,
                    spaceOnTop: false,
                  ),
                  textBuilder(
                    title: 'Data de lançamento: ',
                    text: DateFormat('dd/MM/yyyy').format(
                      DateTime.parse(widget.model.releaseDate),
                    ),
                  ),
                  textBuilder(
                    title: "Generos: ",
                    text: widget.model.genres.map((e) => e.name).join(', '),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textBuilder({
    required String title,
    required String text,
    bool spaceOnTop = true,
  }) {
    return Column(
      children: [
        spaceOnTop ? const SizedBox(height: 8) : const SizedBox(),
        RichText(
          text: TextSpan(
            text: title,
            style: const TextStyle(
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
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
