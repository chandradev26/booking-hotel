import 'package:firebase_database/firebase_database.dart';
import 'package:login/service/firebase_auth.dart';

class UserServices {
  static DatabaseReference ref = FirebaseDatabase.instance.ref("user");

  static Stream<DatabaseEvent> getAkun(uid) {
    DatabaseReference child = ref.child(uid);
    return child.onValue;
  }

  static Future<String> addUser(
      String email, String password, String nama, String phone) async {
    try {
      String uid = await AuthFirebase.addUser(email, password);
      await ref.child(uid).set({
        "email": email,
        "password": password,
        "nama": nama,
        "noHP": phone,
      });
      return uid;
    } catch (e) {
      throw e.toString();
    }
  }
}
