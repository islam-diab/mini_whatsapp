import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:mini_whatsapp/core/model/api_result.dart';
import 'package:mini_whatsapp/core/model/user.dart';

class DataSource {
  Future<ApiResult> register(UserModel user) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      var credential = await firebaseAuth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      Future.wait([
        FirebaseChatCore.instance.createUserInFirestore(
          types.User(
            firstName: user.name,
            id: credential.user!.uid,
            imageUrl: 'https://i.pravatar.cc/300?u=${user.email}',
          ),
        ),
        saveFCMToken(),
      ]);

      return ApiResult(value: credential, isError: false);
    } on FirebaseException catch (e) {
      return ApiResult(value: e.toString(), isError: true);
    } catch (e) {
      return ApiResult(value: e.toString(), isError: true);
    }
  }

  Future<ApiResult> login(String email, password) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      var auth = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return ApiResult(value: auth, isError: false);
    } on FirebaseException catch (e) {
      return ApiResult(value: e.toString(), isError: true);
    } catch (e) {
      return ApiResult(value: e.toString(), isError: true);
    }
  }

  //save user FMC
  Future<void> saveFCMToken() async {
    await FirebaseFirestore.instance
        .collection('User FMC')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({'fcmToken': await FirebaseMessaging.instance.getToken() ?? ''});
  }
}
