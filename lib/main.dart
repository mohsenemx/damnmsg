// ignore_for_file: prefer_const_constructors

import 'package:damnmsg/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// RoL = Login or Register
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://hkcgfpaobzhavyqkdlqz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhrY2dmcGFvYnpoYXZ5cWtkbHF6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTAzMDE3NDAsImV4cCI6MjAwNTg3Nzc0MH0.nMY6hpTIZq7DNpRmoSaPThXG5sGRpv20VYC9pKt_7sM',
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
