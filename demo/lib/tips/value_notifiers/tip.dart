import 'package:flutter/material.dart';

class SetStateExample extends StatefulWidget {
  @override
  _SetStateExampleState createState() => _SetStateExampleState();
}

class _SetStateExampleState extends State<SetStateExample> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent.withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('setState Example', style: TextStyle(fontSize: 20)),
          Text('Counter: $_counter', style: const TextStyle(fontSize: 36)),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: const Text('Increment'),
          ),
        ],
      ),
    );
  }
}

// Example 2: Using ValueNotifier
class ValueNotifierExample extends StatefulWidget {
  @override
  _ValueNotifierExampleState createState() => _ValueNotifierExampleState();
}

class _ValueNotifierExampleState extends State<ValueNotifierExample> {
  final ValueNotifier<int> _counterNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent.withOpacity(0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('ValueNotifier Example', style: TextStyle(fontSize: 20)),
          ValueListenableBuilder<int>(
            valueListenable: _counterNotifier,
            builder: (context, value, child) {
              return Text('Counter: $value', style: const TextStyle(fontSize: 36));
            },
          ),
          ElevatedButton(
            onPressed: () {
              _counterNotifier.value++;
            },
            child: const Text('Increment'),
          ),
        ],
      ),
    );
  }
}