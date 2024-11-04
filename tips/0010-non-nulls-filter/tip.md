# Non-nulls filter

You can use the `nonNulls` extension on `Iterable<T?>` to filter out `null` values and return a `List<T>`.

```dart
class NonNullsTip extends StatelessWidget {
  const NonNullsTip({super.key});

  @override
  Widget build(BuildContext context) {
    List<String?> names = ['Alice', null, 'Bob', null, 'Charlie'];

    List<String> nonNullNamesByType = names.whereType<String>().toList();
    List<String> nonNullNamesByNonNull = names.nonNulls.toList();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Names: $names'), // [Alice, null, Bob, null, Charlie]
          Text('Non-null names: $nonNullNamesByType'), // [Alice, Bob, Charlie]
          Text('Non-null names: $nonNullNamesByNonNull'), // [Alice, Bob, Charlie]
        ],
      ),
    );
  }
}
```