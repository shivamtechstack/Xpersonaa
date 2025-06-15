import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xpersonaa/features/auth/domain/entities/app_user.dart';
import 'package:xpersonaa/features/auth/domain/repo/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo{

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<AppUser?> getCurrentUser() async {
    final firebaseUser = firebaseAuth.currentUser;
    if (firebaseUser != null) {
      return AppUser(
          uid: firebaseUser.uid, email: firebaseUser.email!, name: "");
    } else {
      return null;
    }
  }

  @override
  Future<AppUser> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      AppUser user = AppUser(
          uid: userCredential.user!.uid, email: email, name: "");

      return user;
    }catch (e){
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<AppUser> registerWithEmailAndPassword(String name, String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      AppUser user = AppUser(
          uid: userCredential.user!.uid, email: email, name: name);

      await firestore.collection("users").doc(user.uid).set(user.toJson());

      return user;
    }catch (e){
      throw Exception(e.toString());
    }
  }
  
}