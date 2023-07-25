// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void SignUserOut() {}

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
