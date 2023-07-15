import 'package:flutter/material.dart';
import 'package:mobr1/screens/quiz/components/quiz_button.dart';
import 'package:mobr1/screens/quiz/quiz_finished_screen.dart';

import 'model/question_model.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = '/quiz-screen';

  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuestionModel> questions = [];
  int currentQuestionIndex = 0;
  int correctAnswers = 0;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Pergunta ${currentQuestionIndex + 1}',
          style: const TextStyle(
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentQuestion.question,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 32),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: currentQuestion.options.length,
                itemBuilder: (_, index) {
                  final option = currentQuestion.options[index];
                  return QuizButton(
                    onPressed: () => _onOptionSelected(
                      question: currentQuestion,
                      optionIndex: index,
                    ),
                    text: option,
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loadQuestions() {
    questions = [
      const QuestionModel(
          question: 'Qual é o país que mais produz café no mundo?',
          options: ['Canadá', 'Índia', 'Argentina', 'Brasil', 'Etiópia'],
          answer: 3),
      const QuestionModel(
          question: 'País conhecido por ser o mais fechado do mundo',
          options: ['Myanmar', 'Coréia do Norte', 'Armênia', 'Iêmen', 'Vietnã'],
          answer: 1),
      const QuestionModel(
          question: 'País que possui a Groelândia como território',
          options: [
            'Finlândia',
            'Canadá',
            'Reino Unido',
            'Estados Unidos',
            'Dinamarca'
          ],
          answer: 4),
      const QuestionModel(
          question: 'País com a maior média de qi',
          options: ['China', 'Alemanha', 'Japão', 'Coréia do Sul', 'Noruega'],
          answer: 3),
      const QuestionModel(
          question: 'País com maior IDH (índice de desenvolvimento humano)',
          options: ['Noruega', 'Reino Unido', 'Canadá', 'Holanda', 'México'],
          answer: 0),
      const QuestionModel(
          question: 'Continente menos industrializado',
          options: ['África', 'Ásia', 'Oceania'],
          answer: 0),
      const QuestionModel(
          question: 'País com maior comunidade japonesa fora do Japão',
          options: ['Estados Unidos', 'Brasil', 'Coréia do Sul'],
          answer: 1),
    ];
  }

  void _onOptionSelected({
    required QuestionModel question,
    required int optionIndex,
  }) {
    if (question.answer == optionIndex) {
      correctAnswers++;
    }

    if (currentQuestionIndex >= questions.length - 1) {
      Navigator.pushReplacementNamed(
        context,
        QuizFinishedScreen.routeName,
        arguments: QuizFinishedScreenParams(
          correctAnswers: correctAnswers,
          totalQuestions: questions.length,
        ),
      );
    } else {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }
}
