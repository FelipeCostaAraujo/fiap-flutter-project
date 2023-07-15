// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobr1/screens/dice/dice_screen.dart';
import 'package:mobr1/screens/menu/components/menu_button.dart';
import 'package:mobr1/screens/personal_card/personal_card_screen.dart';
import 'package:mobr1/screens/quiz/quiz_screen.dart';

import '../movies/presentation/containers/movies_container.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = '/menu_screen';

  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                  width: double.infinity,
                  child: MenuButton(
                    text: 'Cartão pessoal',
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        PersonalCardScreen.routeName,
                        arguments: PersonalCardScreenParams(
                          phoneNumber: '123456789',
                          email: 'teste@testinho.com',
                        ),
                      );
                    },
                  )),
              SizedBox(height: 16),
              MenuButton(
                text: 'Dado',
                onPressed: () =>
                    Navigator.pushNamed(context, DiceScreen.routeName),
              ),
              SizedBox(height: 16),
              MenuButton(
                text: 'Quiz',
                onPressed: () =>
                    Navigator.pushNamed(context, QuizScreen.routeName),
              ),
              SizedBox(height: 16),
              MenuButton(
                text: 'Filmes',
                onPressed: () =>
                    Navigator.pushNamed(context, MoviesContainer.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
