import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xpersonaa/firebase_options.dart';
import 'package:xpersonaa/pages/auth_page.dart';
import 'package:xpersonaa/pages/login_page.dart';
import 'package:xpersonaa/themes/light_mode.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A social media app',
      theme: lightMode,
      home: AuthPage(),
    );
  }
}
