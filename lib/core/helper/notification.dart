import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class NotificationService {
  static Future<String> getAccessToken() async {
    final serviceAccountJson = {
      "type": dotenv.env['TYPE'],
      "project_id": dotenv.env['PROJECT_ID'],
      "private_key_id": dotenv.env['PRIVATE_KEY_ID'],
      "private_key": dotenv.env['PRIVATE_KEY'],
      "client_email": dotenv.env['CLIENT_EMAIL'],
      "client_id": dotenv.env['CLIENT_ID'],
      "auth_uri": dotenv.env['AUTH_URI'],
      "token_uri": dotenv.env['TOKEN_URI'],
      "auth_provider_x509_cert_url": dotenv.env['AUTH_PROVIDER_X509_CERT_URL'],
      "client_x509_cert_url": dotenv.env['CLIENT_X509_CERT_URL'],
      "universe_domain": dotenv.env['UNIVERSE_DOMAIN'],
    };

    List<String> scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );

    auth.AccessCredentials credentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client,
    );
    client.close();
    return credentials.accessToken.data;
  }

  static Future<void> sendNotification(
      String fmcToken, String title, String body) async {
    final String accessToken = await getAccessToken();

    String endpoint =
        'https://fcm.googleapis.com/v1/projects/chat-app-23e3b/messages:send';

    final Map<String, dynamic> message = {
      "message": {
        "token": fmcToken,
        "notification": {"title": title, "body": body},
      }
    };

    final http.Response response = await http.post(
      Uri.parse(endpoint),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      log('Notification sent successfully');
    } else {
      log('Failed to send notification${response.statusCode}');
    }
  }

  static Future<String> getFMCToken(String otherUserId) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('User FMC')
        .doc(otherUserId)
        .get();

    if (documentSnapshot.exists) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      String? fmc = data['fcmToken'];
      return fmc ?? '';
    } else {
      return '';
    }
  }
}
