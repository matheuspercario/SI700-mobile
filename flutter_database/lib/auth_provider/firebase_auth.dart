import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_database/model/user.dart';

class FirebaseAuthenticationService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel> signInAnonimo() async {
    UserCredential authResult = await _firebaseAuth.signInAnonymously();
    User user = authResult.user;

    return UserModel(user.uid);
  }
}
