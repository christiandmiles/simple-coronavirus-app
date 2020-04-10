import 'package:flutter/material.dart';

import 'widgets/CDCAdvice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: CDCAdvice()
    );
  }
}

