import 'package:flutter/material.dart';

class MoviesErrorScreen extends StatelessWidget {
  const MoviesErrorScreen({
    super.key,
    required this.onBackPressed,
    required this.errorMessage,
  });

  final VoidCallback onBackPressed;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: onBackPressed,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Ops, parece que ocorreu uma falha\n\nErro retornado: $errorMessage',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          )
        ),
      ),
    );
  }
}
