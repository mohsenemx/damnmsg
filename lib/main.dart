// ignore_for_file: prefer_const_constructors

import 'package:damnmsg/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/*
 * Remember to change your keys accordingly, this file is not provided by default as it contains sensitive information.
 * You can also use ./secrets_template.dart
 */
import './secrets.dart';

// RoL = Login or Register
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: authUrl,
    anonKey: authKey,
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
