import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobr1/features/profile/domain/entities/profile_entity.dart';

import '../../../../core/errors/domain_errors.dart';
import '../../domain/usecases/usecases.dart';

class LoadProfileImpl implements LoadProfile {
  @override
  Future<ProfileEntity> call() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      final profileUser = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();
      var url = await loadStorage(user.uid);
      return ProfileEntity(
        name: profileUser['name'],
        email: profileUser['email'],
        imageUrl: url,
      );
    } on FirebaseException catch (error) {
      switch (error.code) {
        case 'permission-denied':
          throw DomainError.accessDenied;
        default:
          throw DomainError.unexpected;
      }
    }
  }

  Future<String?> loadStorage(String userId) async {
    try {
      final storage = FirebaseStorage.instance;
      final ref = storage.ref('profile/$userId.png');
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      return null;
    }
  }
}
