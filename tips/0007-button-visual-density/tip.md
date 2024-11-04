# Button Visual Density

You can update the label padding on buttons using ButtonStyle.visualDensity

Each increment on the scale of -4 (dense) to 4 (expanded) corresponds to 4 logical pixels 

Compact: -2, -2
Comfortable: -1, -1
Standard: 0, 0

```dart
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
```