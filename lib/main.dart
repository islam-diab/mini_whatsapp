import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini_whatsapp/core/routing/app_router.dart';
import 'package:mini_whatsapp/mini_whatsapp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MiniWhatsapp(
      appRouter: AppRouter(),
    ),
  );
}
