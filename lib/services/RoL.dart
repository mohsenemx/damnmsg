// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:damnmsg/pages/login.dart';
import 'package:damnmsg/pages/register.dart';
import 'package:flutter/material.dart';

class RoL extends StatelessWidget {
  const RoL({super.key});

  final toggleScreen = true;

  @override
  Widget build(BuildContext context) {
    if (toggleScreen) {
      return LoginScreen();
    } else {
      return RegisterScreen();
    }
  }
}
