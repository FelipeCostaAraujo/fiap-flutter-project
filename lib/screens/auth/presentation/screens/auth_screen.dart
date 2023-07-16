import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobr1/screens/screens.dart';

import '../bloc/auth_cubit_state.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth_screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var email = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bem vindo!',
          style: TextStyle(color: Colors.deepPurple),
        ),
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.15),
      ),
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
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () => _authenticateUser(
                context: context,
                email: email,
                password: password,
              ),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        child: TextButton(
          onPressed: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: const Text('Nao tenho conta, criar uma'),
        ),
      ),
    );
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
        .then((value) =>
            Navigator.pushReplacementNamed(context, HomeScreen.routeName))
        .onError(
          (error, stackTrace) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                (error as FirebaseException).message ?? 'Erro desconhecido',
              ),
            ),
          ),
        );
  }
}
