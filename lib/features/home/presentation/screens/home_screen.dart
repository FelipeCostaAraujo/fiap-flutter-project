import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobr1/core/core.dart';

import '../../../features.dart';
import 'components/componets.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  final List<HomeViewModel> moviesList;
  const HomeScreen({required this.moviesList, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with NavigationManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                    ),
                    child: Text(
                      'Filmes Fiap',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Perfil'),
                        SizedBox(width: 8),
                        Icon(Icons.person),
                      ],
                    ),
                    onTap: () async {
                      //navigateTo(ProfileScreen.routeName, context);
                    },
                  ),
                  ListTile(
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Logout'),
                        SizedBox(width: 8),
                        Icon(Icons.logout),
                      ],
                    ),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      if (context.mounted) {
                        navigateTo(AuthScreen.routeName, context, clear: true);
                      }
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                reverse: true,
                children: [
                  ListTile(
                    title: const Text('Versão 1.0.0'),
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: BlocConsumer<HomeCubit, HomeCubitState>(
        listener: (context, state) {
          if (state.status == HomeCubitStateStatus.error) {
            showError(context, state.error!);
          }
          if (state.status == HomeCubitStateStatus.loaded) {
            hideLoading(context);
          }
        },
        builder: (context, state) {
          if (state.status == HomeCubitStateStatus.loading) {
            showLoading(context);
          }
          if (state.status == HomeCubitStateStatus.loaded) {
            return ListView.separated(
              itemCount: widget.moviesList.length,
              padding: const EdgeInsets.all(16),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final movie = widget.moviesList[index];
                return MoviesListCell(
                  movie: movie,
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  _HomeScreenState();
}
