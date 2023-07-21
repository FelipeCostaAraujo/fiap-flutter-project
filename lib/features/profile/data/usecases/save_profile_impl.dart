import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io' as io;

import '../../../../core/errors/domain_errors.dart';
import '../../domain/usecases/usecases.dart';
import '../../domain/entities/entities.dart';

class SaveProfileImpl implements SaveProfile {
  @override
  Future<void> call(ProfileEntity profileEntity) async {
    try{
      var user = FirebaseAuth.instance.currentUser!;
      String? url;
      if(profileEntity.imageUrl != null){
        url = await saveStorage(profileEntity, user.uid);
      }
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'name': profileEntity.name,
        'email': profileEntity.email,
        'profileImage': url,
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

  Future<String?> saveStorage(ProfileEntity profileEntity, String userId) async {
    try{
      final storage = FirebaseStorage.instance;
      final ref = storage.ref('profile/$userId.png');
      await ref.putFile(io.File(profileEntity.imageUrl!));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch(e) {
      switch(e.code){
        case 'permission-denied':
          throw DomainError.accessDenied;
        default:
          throw DomainError.unexpected;
      }
    }
  }

}