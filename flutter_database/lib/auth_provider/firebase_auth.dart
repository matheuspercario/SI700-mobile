import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_database/data/firestore/firestore_database.dart';
import 'package:flutter_database/model/user.dart';

class FirebaseAuthenticationService {
  // Padrao singlethon do Firebase
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<UserModel> get user {
    return _firebaseAuth.authStateChanges().map(
          (User user) => _userFromFirebaseUser(user),
        );
  }

  UserModel _userFromFirebaseUser(User user) {
    return user != null ? UserModel(user.uid) : null;
  }

  Future<UserModel> signInAnonimo() async {
    UserCredential authResult = await _firebaseAuth.signInAnonymously();
    User user = authResult.user;

    return UserModel(user.uid);
  }

  signInWithEmailAndPassword({String email, String password}) async {
    UserCredential authResult = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User user = authResult.user;
    return UserModel(user.uid);
  }

  // Aumentar paramtros... mais dados enviados!
  createUserWithEmailAndPassword(
      {String email, String password, int idade = 22, int ra = 222327}) async {
    UserCredential authResult =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User user = authResult.user;

    // Invocar Firestore para inserir informacoes a mais...
    // FirestoreRemoteServer.helper.includeUserData(uid, email, idade, ra);

    return UserModel(user.uid);
  }

  signOut() async {
    await _firebaseAuth.signOut();
  }
}
