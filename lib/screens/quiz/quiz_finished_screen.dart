import 'package:flutter/material.dart';

class QuizFinishedScreenParams {
  const QuizFinishedScreenParams({
    required this.correctAnswers,
    required this.totalQuestions,
  });

  final int correctAnswers;
  final int totalQuestions;
}

class QuizFinishedScreen extends StatelessWidget {
  static const routeName = '/quiz-finished-screen';

  const QuizFinishedScreen({
    super.key,
    required this.params,
  });

  final QuizFinishedScreenParams params;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Quiz finalizado!',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Text(
          '\nSeu resultado foi ${params.correctAnswers}/${params.totalQuestions}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
