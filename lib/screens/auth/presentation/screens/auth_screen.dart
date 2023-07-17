import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobr1/components/spinner_dialog.dart';
import 'package:mobr1/screens/screens.dart';

import '../../../../mixins/navigation_manager.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth_screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with NavigationManager {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Bem vindo!',
          style: TextStyle(color: Colors.deepPurple),
        ),
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.15),
      ),
      body: BlocConsumer<AuthCubit,AuthCubitState>(
        listener: (context, state) {
          if (state.status == AuthCubitStateStatus.authenticated) {
            Navigator.pushNamed(context, HomeScreen.routeName);
          }
        },
        builder: (context, state) {
          if(state.status == AuthCubitStateStatus.loading){
            showLoading(context);
          }
          if(state.status == AuthCubitStateStatus.error){
            hideLoading(context);
            showError(state.error ?? "Erro desconhecido");
          }
          if(state.status == AuthCubitStateStatus.authenticated){
            navigateTo(HomeScreen.routeName,context);
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
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
                  onChanged: (newEmail) {},
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  onChanged: (newPassword) {},
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
                  onPressed: () async => await context.read<AuthCubit>().signIn(
                    _emailController.text,
                    _passwordController.text,
                  ),
                  child: const Text('Login'),
                ),
              ],
            ),
          );
        },
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

  showError(String error){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.red,
            content: Center(
              child: Text(error),
            )
        ),
      );
    });
  }
}
