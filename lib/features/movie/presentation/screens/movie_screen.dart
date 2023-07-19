import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobr1/features/movie/movie.dart';

class MovieScreen extends StatelessWidget {
  static const String routeName = '/movie_detail';
  final MovieViewModel model;
  const MovieScreen({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detalhes do filme",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Text(
                model.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 36),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(model.posterPath),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textBuilder(
                    title: "Sinopse: ",
                    text: model.overview,
                    spaceOnTop: false,
                  ),
                  textBuilder(
                    title: 'Data de lançamento: ',
                    text: DateFormat('dd/MM/yyyy').format(
                      DateTime.parse(model.releaseDate),
                    ),
                  ),
                  textBuilder(
                    title: "Generos: ",
                    text: model.genres.map((e) => e.name).join(', '),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textBuilder(
      {required String title, required String text, bool spaceOnTop = true}) {
    return Column(
      children: [
        spaceOnTop ? const SizedBox(height: 8) : const SizedBox(),
        RichText(
          text: TextSpan(
            text: title,
            style: const TextStyle(
              color: Colors.black,
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
