import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobr1/core/components/components.dart';
import 'package:mobr1/features/features.dart';

import 'components/components.dart';

class FavoritesScreen extends StatelessWidget {
  static const String routeName = '/favorites';
  final List<FavoritesViewModel> favoritesList;
  const FavoritesScreen({required this.favoritesList, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Filmes favoritos",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocConsumer<FavoritesCubit, FavoritesCubitState>(
        listener: (context, state) {
          if (state.status == FavoritesCubitStateStatus.error) {
            showError(context, state.error!);
          }
        },
        builder: (context, state) {
          if (favoritesList.isEmpty) {
            return const Center(
              child: Text(
                "Nenhum filme favorito",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }
          return ListView.separated(
            itemCount: favoritesList.length,
            padding: const EdgeInsets.all(16),
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final favorite = favoritesList[index];
              return FavoriteListCell(
                movie: favorite,
                onDeletedFavorite: () async => await context
                    .read<FavoritesCubit>()
                    .onRemoveFavoriteMovie(movie: favorite.toEntity()),
              );
            },
          );
        },
      ),
    );
  }
}
