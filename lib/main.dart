import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/routing/app_router.dart';
import 'package:mini_whatsapp/firebase_options.dart';
import 'package:mini_whatsapp/mini_whatsapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.instance.requestPermission();

  runApp(
    MiniWhatsapp(
      appRouter: AppRouter(),
    ),
  );
}
