// ignore_for_file: file_names

import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const InputBox(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
