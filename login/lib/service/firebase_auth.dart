import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User> signIn(email, password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return user;
    } catch (e) {
      throw (e.toString());
    }
  }

  static Future<void> signOut(String topic) async {
    _auth.signOut();
  }
}