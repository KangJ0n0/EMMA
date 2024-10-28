import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:emma/ui/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // using assets: in pubspec.yaml so that the package can be read -_-
  await dotenv.load(fileName: "assets/.env");

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env[getApiKey()] ??
          '', // Use ?? '' to provide a default empty string
      appId: dotenv.env[getAppId()] ?? '',
      messagingSenderId: dotenv.env[getMessagingSenderId()] ?? '',
      projectId: dotenv.env[getProjectId()] ?? '',
      authDomain: dotenv.env['WEB_AUTH_DOMAIN'] ?? '',
      storageBucket: dotenv.env[getStorageBucket()] ?? '',
      measurementId: dotenv.env['WEB_MEASUREMENT_ID'] ?? '', // Only for web
    ),
  );

  runApp(const MyApp());
}

// Helper functions
String getApiKey() {
  if (defaultTargetPlatform == TargetPlatform.android) return 'ANDROID_API_KEY';
  if (defaultTargetPlatform == TargetPlatform.iOS) return 'IOS_API_KEY';
  return 'WEB_API_KEY';
}

String getAppId() {
  if (defaultTargetPlatform == TargetPlatform.android) return 'ANDROID_APP_ID';
  if (defaultTargetPlatform == TargetPlatform.iOS) return 'IOS_APP_ID';
  return 'WEB_APP_ID';
}

String getMessagingSenderId() {
  if (defaultTargetPlatform == TargetPlatform.android)
    return 'ANDROID_MESSAGING_SENDER_ID';
  if (defaultTargetPlatform == TargetPlatform.iOS)
    return 'IOS_MESSAGING_SENDER_ID';
  return 'WEB_MESSAGING_SENDER_ID';
}

String getProjectId() {
  if (defaultTargetPlatform == TargetPlatform.android)
    return 'ANDROID_PROJECT_ID';
  if (defaultTargetPlatform == TargetPlatform.iOS) return 'IOS_PROJECT_ID';
  return 'WEB_PROJECT_ID';
}

String getStorageBucket() {
  if (defaultTargetPlatform == TargetPlatform.android)
    return 'ANDROID_STORAGE_BUCKET';
  if (defaultTargetPlatform == TargetPlatform.iOS) return 'IOS_STORAGE_BUCKET';
  return 'WEB_STORAGE_BUCKET';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMMA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
