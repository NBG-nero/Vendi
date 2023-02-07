import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> authStateChanges() {
    return auth.idTokenChanges();
  }

  Future getCurrentEmail() async {
    return auth.currentUser?.email;
  }

  Future<String?> createUserWithEmailAndPassword(
      String? name, String email, String password) async {
    final User? currentUser = (await auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;

    return currentUser?.uid;
  }
}
