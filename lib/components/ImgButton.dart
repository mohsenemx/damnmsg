// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String ImgPath;
  void Function()? onTap;
  ImageButton({super.key, required this.ImgPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(244, 244, 244, 0.6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              ImgPath,
              height: 50,
              width: 50,
            ),
          ),
        ),
      ),
    );
  }
}
