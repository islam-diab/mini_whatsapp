import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_whatsapp/core/model/api_result.dart';

class DataSource {
  Future<ApiResult> login(String email, String password) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
   var auth = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return ApiResult(value: auth, isError: false);
  }
}
