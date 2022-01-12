import 'package:flutter/material.dart';

import 'package:petgrooming/HomePage.dart';

class cart extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carts page')),
    );
  }
}