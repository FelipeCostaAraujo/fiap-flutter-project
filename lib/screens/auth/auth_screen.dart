import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobr1/screens/menu/menu_screen.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth_screen';

  AuthScreen({super.key});

  var email = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onChanged: (newEmail) {
              email = newEmail;
            },
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: (newPassword) {
              password = newPassword;
            },
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Senha',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => _authenticateUser(
              context: context,
              email: email,
              password: password,
            ),
            child: const Text('Login'),
          ),
        ],
      ),
    ));
  }

  Future<void> _authenticateUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final authInstance = FirebaseAuth.instance;

    authInstance
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) => Navigator.pushReplacementNamed(context, MenuScreen.routeName))
        .onError(
          (error, stackTrace) => authInstance
              .createUserWithEmailAndPassword(email: email, password: password)
              .then(
                  (value) => Navigator.pushReplacementNamed(context, MenuScreen.routeName))
              .onError(
                (error, stackTrace) =>
                    ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      (error as FirebaseException).message ?? 'Erro desconhecido',
                    ),
                  ),
                ),
              ),
        );
  }
}
