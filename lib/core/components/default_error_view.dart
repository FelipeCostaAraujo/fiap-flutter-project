import 'package:flutter/material.dart';

class DefaultErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onTryAgain;
  const DefaultErrorView(
      {required this.onTryAgain, required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Center(
              child: Text(
                message,
                style: const TextStyle(fontSize: 24, color: Colors.red),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: onTryAgain,
            child: const Text("Tente novamente"),
          ),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
