// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void SignUserOut() {
    FirebaseAuth.instance.signOut();
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
