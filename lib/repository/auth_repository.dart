import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signUp({required String email,required String password}) async {
    final newUserCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return newUserCredential.user;
  }
  Future<User?> signIn(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
  User? getCurrentUser()  {
    return _firebaseAuth.currentUser;

  }
}