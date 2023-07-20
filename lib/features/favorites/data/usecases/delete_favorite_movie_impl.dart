import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/core.dart';
import '../../domain/usecases/usecases.dart';

class DeleteFavoriteMovieImpl implements DeleteFavoriteMovie {
  @override
  Future<void> call(int id) async {
    try {
      var user = FirebaseAuth.instance.currentUser!;

      await FirebaseFirestore.instance
          .collection('favorites/${user.uid}/movies')
          .doc(id.toString())
          .delete();
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
