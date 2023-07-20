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
  MoviesOptions? selectedMenu;
  bool moviesGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Lista de Filmes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: moviesGrid
                ? const Icon(Icons.list)
                : const Icon(Icons.grid_view_sharp),
            onPressed: () async {
              setState(() {
                moviesGrid = !moviesGrid;
              });
            },
          ),
          PopupMenuButton<MoviesOptions>(
            initialValue: selectedMenu,
            // Callback that sets the selected popup menu item.
            onSelected: (MoviesOptions item) {
              setState(() {
                selectedMenu = item;
              });
            },
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<MoviesOptions>>[
              PopupMenuItem<MoviesOptions>(
                value: MoviesOptions.moreRecent,
                child: const Text('Mais recentes'),
                onTap: () async =>
                    await context.read<HomeCubit>().loadMoviesByOptions(
                          MoviesOptions.moreRecent,
                        ),
              ),
              PopupMenuItem<MoviesOptions>(
                value: MoviesOptions.morePopular,
                child: const Text('Mais populares'),
                onTap: () async =>
                    await context.read<HomeCubit>().loadMoviesByOptions(
                          MoviesOptions.morePopular,
                        ),
              ),
              PopupMenuItem<MoviesOptions>(
                value: MoviesOptions.moreRated,
                child: const Text('Maior avaliação'),
                onTap: () async =>
                    await context.read<HomeCubit>().loadMoviesByOptions(
                          MoviesOptions.moreRated,
                        ),
              ),
            ],
          ),
        ],
      ),
      drawer: SafeArea(
        bottom: false,
        child: Drawer(
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
                          Text('Favoritos'),
                          SizedBox(width: 8),
                          Icon(Icons.star),
                        ],
                      ),
                      onTap: () async {
                        navigateTo(FavoritesScreen.routeName, context);
                      },
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
                          Text('Configurações'),
                          SizedBox(width: 8),
                          Icon(Icons.settings),
                        ],
                      ),
                      onTap: () async {
                        //navigateTo(Favorites.routeName, context);
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
                          navigateTo(AuthScreen.routeName, context,
                              clear: true);
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
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
            return moviesGrid
                ? MoviesGridView(moviesList: widget.moviesList)
                : MoviesListView(moviesList: widget.moviesList);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  _HomeScreenState();
}
