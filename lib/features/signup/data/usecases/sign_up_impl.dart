import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobr1/core/core.dart';

import '../../domain/usecases/usecases.dart';

class SignUpImpl implements SignUp {
  @override
  Future<void> execute(SignUpParams params) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      if (userCredential.user == null) {
        throw DomainError.unexpected;
      }
      String userId = userCredential.user!.uid;

      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'name': params.name,
        'email': params.email,
      });
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw DomainError.emailInUse;
        case 'invalid-email':
          throw DomainError.emailInvalid;
        case 'weak-password':
          throw DomainError.passwordWeak;
        default:
          throw DomainError.unexpected;
      }
    }
  }
}
