import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthServices {
  Future<bool> loginWithEmailAndPassword(String email, String password);
  Future<bool> registerWithEmailAndPassword(String email, String password);
}

class AuthServicesImpl implements AuthServices {
  @override
  Future<bool> loginWithEmailAndPassword(String email, String password) async {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    final user = userCredential.user;
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    final user = userCredential.user;
    if (user != null) {
      return true;
    } else {
      return false;
    }
  }
}
