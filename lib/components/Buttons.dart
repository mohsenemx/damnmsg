// ignore_for_file: must_be_immutable, file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  final String text;
  void Function()? onTap;
  GenericButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
