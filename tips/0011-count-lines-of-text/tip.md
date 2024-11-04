# Count lines of text

You can count the number of lines of text that a `TextSpan` will span by using the `TextPainter.computeLineMetrics` method.

```dart
class LineCountTip extends StatelessWidget {
  const LineCountTip({super.key});

  @override
  Widget build(BuildContext context) {
    const textSpan = TextSpan(
        // text: 'Hello X',
        // text: 'Hello X, this is a medium length text',
        text: 'Hello X, this is a long length text that will span multiple lines',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ));

    List<LineMetrics> getLineMetrics(double width, TextSpan textSpan) {
      final textPainter =
          TextPainter(text: textSpan, textDirection: TextDirection.ltr);

      textPainter.layout(
        minWidth: 0,
        maxWidth: width,
      );

      return textPainter.computeLineMetrics();
    }

    double width = 200;

    return Scaffold(
      appBar: AppBar(title: const Text('tip')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final lineMetrics = getLineMetrics(width, textSpan);

          return Center(
            child: Column(
              children: [
                Text('Line count: ${lineMetrics.length}'),
                const SizedBox(height: 16),
                Center(
                  child: SizedBox(
                    width: width,
                    child: ColoredBox(
                      color: Colors.grey.shade300,
                      child: RichText(text: textSpan),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
```