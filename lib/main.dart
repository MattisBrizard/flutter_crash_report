import 'package:flutter/material.dart';
import 'package:poc_fnow/modules/root.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Root(),
    );
  }
}
