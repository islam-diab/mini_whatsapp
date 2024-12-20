import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_whatsapp/core/model/api_result.dart';
import 'package:mini_whatsapp/core/model/user.dart';

class DataSource {
  Future<ApiResult> register(UserModel user) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    var auth = await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);

    saveUserData(user);
    return ApiResult(value: auth, isError: false);
  }

  Future<ApiResult> login(String email, password) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    var auth = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return ApiResult(value: auth, isError: false);
  }

  // save user data to firestore
  Future<void> saveUserData(UserModel user) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('users').doc(user.uid).set(user.toJson());
    // save user data to firestore
  }
}
