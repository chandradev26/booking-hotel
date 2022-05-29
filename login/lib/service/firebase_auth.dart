import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<User> signIn(email, password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return user;
    } catch (e) {
      throw (e.toString());
    }
  }

  static Future<String> addUser(String email, String password) async {
    try {
      UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
     return userCredential.user!.uid;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<void> signOut() async {
    await auth.signOut();
  }
}