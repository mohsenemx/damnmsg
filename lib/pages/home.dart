// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final supabase = Supabase.instance.client;
  void SignUserOut() {
    supabase.auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'), actions: [
        IconButton(
          onPressed: SignUserOut,
          icon: Icon(Icons.logout),
        )
      ]),
      body: Container(
        child: Center(
          child: Text('You are logged in.'),
        ),
      ),
    );
  }
}
