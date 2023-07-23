// ignore_for_file: prefer_const_constructors

import 'package:damnmsg/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// RoL = Login or Register
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(TheApp());
}

class TheApp extends StatefulWidget {
  const TheApp({super.key});

  @override
  State<TheApp> createState() => _TheAppState();
}

class _TheAppState extends State<TheApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
