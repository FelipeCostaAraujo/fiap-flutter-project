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
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                if (context.mounted) {
                  navigateTo(AuthScreen.routeName, context);
                }
              },
            ),
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
}
