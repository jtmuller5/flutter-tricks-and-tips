import 'package:demo/tips/ink_image/tip.dart';
import 'package:demo/tips/non-nulls/tip.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: InkImage(),
      ),
    );
  }
}
