import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobr1/core/errors/domain_errors.dart';

import '../../domain/usecases/verify_user_loggedin.dart';

class VerifyUserLoggedInImpl implements VerifyUserLoggedIn {
  @override
  Future<void> call() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception();
      }
    } catch (e) {
      throw DomainError.userNotFound;
    }
  }
}
