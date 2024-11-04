import 'package:flutter/material.dart';

class ColorLayers extends StatelessWidget {
  const ColorLayers({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the colors with transparency
    final Color baseColor = Colors.blue.withOpacity(0.5);
    final Color foregroundColor = Colors.red.withOpacity(0.5);
    final Color blendedColor = Color.alphaBlend(foregroundColor, baseColor);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Layers'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the base color
            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Base Color'),
                  Container(
                    width: 100,
                    height: 100,
                    color: baseColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Display the foreground color
            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Foreground Color'),
                  Container(
                    width: 100,
                    height: 100,
                    color: foregroundColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Display the blended color
            SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Blended Color'),
                  Container(
                    width: 100,
                    height: 100,
                    color: blendedColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
