






import 'package:flutter/material.dart';

class FractionallySizedBoxExample extends StatelessWidget {
  const FractionallySizedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FractionallySizedBox Example',
      home: Scaffold(
        body: Container(
          color: Colors.blue,
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.5, // 50% of the parent width
              heightFactor: 0.3, // 30% of the parent height
              child: Container(
                color: Colors.redAccent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
