import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'view/tela_inicio.dart';




void main() {
  runApp(MyApp());
}

// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        body: tela_inicio(),
      ),
    );
  }
}