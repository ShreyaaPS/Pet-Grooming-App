// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final GestureTapCallback? onTap;

  CustomButton({required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: onTap,
      child: Text(name),
    );
  }
}
