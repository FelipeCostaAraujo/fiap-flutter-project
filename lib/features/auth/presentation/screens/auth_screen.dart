import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobr1/core/core.dart';

import '../../../features.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with NavigationManager, KeyboardManager {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: InkWell(
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: () => hideKeyboard(context),
        child: BlocConsumer<AuthCubit, AuthCubitState>(
          listener: (context, state) {
            if (state.status == AuthCubitStateStatus.loading) {
              showLoading(context);
            }
            if (state.status == AuthCubitStateStatus.error) {
              hideLoading(context);
              showError(context, state.error ?? "Erro desconhecido");
            }
            if (state.status == AuthCubitStateStatus.authenticated) {
              navigateTo(HomeScreen.routeName, context);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
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
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return 'Email obrigatório';
                        }
                        if (!email.contains('@')) {
                          return 'Email inválido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
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
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return 'Senha obrigatória';
                        }
                        if (password.length < 6) {
                          return 'Senha deve ter no mínimo 6 caracteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.9, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () async {
                        if (_emailController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          showSnackMessage(context, 'Preencha todos os campos');
                          return;
                        }
                        if (formKey.currentState!.validate()) {
                          await context.read<AuthCubit>().signIn(
                                _emailController.text,
                                _passwordController.text,
                              );
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        height: 60,
        child: TextButton(
          style: TextButton.styleFrom(
            elevation: 2,
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
            disabledBackgroundColor: Theme.of(context)
                .primaryColor
                .withOpacity(0.5)
                .withOpacity(0.5),
          ),
          onPressed: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: const Text(
            'Não tem uma conta? Cadastre-se!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
