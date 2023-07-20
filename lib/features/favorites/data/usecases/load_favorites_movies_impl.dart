import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobr1/core/core.dart';

import '../../favorites.dart';

class LoadFavoritesMoviesImpl implements LoadFavoritesMovies {
  @override
  Future<List<FavoriteMovieEntity>> call() async {
    try {
      var user = FirebaseAuth.instance.currentUser!;
      final snapshot = await FirebaseFirestore.instance
          .collection('favorites/${user.uid}/movies')
          .get();
      List<FavoriteMovieEntity> movies = [];
      for (var element in snapshot.docs) {
        movies
            .add(RemoteFavoriteMovieModel.fromJson(element.data()).toEntity());
      }
      return movies;
    } on FirebaseException catch (error) {
      switch (error.code) {
        case 'permission-denied':
          throw DomainError.accessDenied;
        default:
          throw DomainError.unexpected;
      }
    }
  }
}
