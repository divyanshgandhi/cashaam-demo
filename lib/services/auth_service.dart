import 'package:cashaam/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthService {
  Future<UserModel> getCurrentUser();

  Future<void> signOut();

  Stream<User?> onAuthStateChanged();

  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<UserCredential> createUserWithEmailAndPassword(
      {required String email, required String password});
}

class AuthService extends IAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _usersDB =
      FirebaseFirestore.instance.collection('Users');

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final User? firebaseUser = _auth.currentUser;
      final DocumentSnapshot documentSnapshot =
          await _usersDB.doc(firebaseUser!.uid).get();
      return UserModel.fromDoc(documentSnapshot);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signOut() {
    return _auth.signOut();
  }

  @override
  Stream<User?> onAuthStateChanged() {
    return _auth.idTokenChanges();
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
      {required String email, required String password}) {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
