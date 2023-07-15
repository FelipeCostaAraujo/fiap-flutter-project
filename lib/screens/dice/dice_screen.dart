import 'dart:math';

import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  static const routeName = '/dice';

  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int dice1 = 5;
  int dice2 = 3;

  void _throwDices() {
    final random = Random();
    dice1 = random.nextInt(6) + 1;
    dice2 = random.nextInt(6) + 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
          child: Center(
            child: InkWell(
              onTap: _throwDices,
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset('assets/images/dice$dice1.png'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Image.asset('assets/images/dice$dice2.png'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
