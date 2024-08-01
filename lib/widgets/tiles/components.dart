import 'package:flutter/material.dart';

Widget tileButton(IconData icon, void Function()? onPressed) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: IconButton.filled(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
    ),
  );
}
