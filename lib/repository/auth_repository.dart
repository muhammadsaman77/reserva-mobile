import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:booking_app/data/model/user.dart' as user;

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<User?> signUp({required  String email,required String password, required String username, required String phoneNumber}) async {

    final newUserCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    await _db.collection('users').doc(newUserCredential.user!.uid).set({
      "username": username,
      "phoneNumber": phoneNumber,
      "roles": "guest"
    });
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
  Future<user.User> getFullUser() async {
    final id = getCurrentUser()!.uid;
    final response = await _db.collection("users").doc(id).get();
    return user.User.fromJson(response.data()!,id);
  }
}