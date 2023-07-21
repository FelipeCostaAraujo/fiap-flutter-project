import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobr1/features/features.dart';

import '../../../../core/core.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with KeyboardManager, NavigationManager {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocConsumer<SignUpCubit, SignUpCubitState>(
          listener: (context, state) {
        if (state.status == SignUpCubitStateStatus.loading) {
          showLoading(context);
        }
        if (state.status == SignUpCubitStateStatus.error) {
          hideLoading(context);
          showError(context, state.error ?? "Erro desconhecido");
        }
        if (state.status == SignUpCubitStateStatus.success) {
          hideLoading(context);
          navigateTo(HomeScreen.routeName, context);
        }
      }, builder: (context, state) {
        return GestureDetector(
          onTap: () => hideKeyboard(context),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 100),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Nome',
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nome é obrigatório';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12.0),
                    TextFormField(
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
                    const SizedBox(height: 12.0),
                    TextFormField(
                      controller: _passwordController,
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
                      obscureText: true,
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
                    const SizedBox(height: 24.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.9, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await context.read<SignUpCubit>().register(
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                        }
                      },
                      child: const Text('Cadastrar Usuário'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
