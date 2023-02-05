import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> get authStateChanges => auth.idTokenChanges();
  Future getCurrentEmail() async {
    return auth.currentUser?.email;
  }
}
