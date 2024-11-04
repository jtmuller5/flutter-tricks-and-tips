import 'package:flutter/material.dart';

class VisualDensityDemo extends StatelessWidget {
  const VisualDensityDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visual Density'),
      ),
      backgroundColor: Color(0xffDEAB63),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: const Text('Compact'),
            ),
            ElevatedButton(
              style: const ButtonStyle(visualDensity: VisualDensity.comfortable),
              onPressed: () {},
              child: const Text('Comfortable'),
            ),
            ElevatedButton(
              style: const ButtonStyle(visualDensity: VisualDensity.standard),
              onPressed: () {},
              child: const Text('Standard'),
            ),
            ElevatedButton(
              style: const ButtonStyle(visualDensity: VisualDensity(
                horizontal: 2,
                vertical: 2
              )),
              onPressed: () {},
              child: const Text('Custom'),
            ),
          ],
        ),
      ),
    );
  }
}
