import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobr1/core/errors/domain_errors.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';

class SetFavoriteMovieImpl implements SetFavoriteMovie {
  @override
  Future<void> call({
    required MovieDetailEntity movie,
    required bool isFavorite,
  }) async {
    try {
      var user = FirebaseAuth.instance.currentUser!;
      await FirebaseFirestore.instance
          .collection('favorites/${user.uid}/movies')
          .doc(movie.id.toString())
          .set({
        'id': movie.id,
        'title': movie.title,
        'posterPath': movie.posterPath,
        'isFavorite': isFavorite,
      });
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
