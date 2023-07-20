import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/core.dart';
import '../../domain/usecases/usecases.dart';

class VerifyMovieIsFavoriteImpl implements VerifyMovieIsFavorite {
  @override
  Future<bool> call({required String id}) async {
    try {
      var user = FirebaseAuth.instance.currentUser!;
      var movie = await FirebaseFirestore.instance
          .collection('favorites')
          .doc(user.uid)
          .collection(id)
          .get();
      return movie.docs[0]['isFavorite'];
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
