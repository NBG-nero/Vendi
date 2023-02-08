import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

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
    log('createuser was called');
    var updateInfo = UserInfo({'email': email});
    name = updateInfo.displayName;
    await currentUser?.updateDisplayName(name);
    await currentUser?.reload();
    return currentUser?.uid;
  }

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    log('siginIn User was called');
    return ((await auth.signInWithEmailAndPassword(
                email: email, password: password))
            .user)!
        .uid;
  }
}
