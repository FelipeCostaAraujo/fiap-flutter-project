import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobr1/screens/auth/domain/usecases/authentication.dart';

import '../../domain/utils/domain_errors.dart';

class RemoteAuthentication implements Authentication {

  @override
  Future<void> execute(AuthenticationParams params) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
    }on FirebaseAuthException catch (error) {
      switch(error.code){
        case 'user-not-found':
        case 'wrong-password':
          throw DomainError.invalidCredentials;
        default:
          throw DomainError.unexpected;
      }
    }
  }
}
