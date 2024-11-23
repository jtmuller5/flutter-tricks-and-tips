Make your images splash using the [Ink.image](https://api.flutter.dev/flutter/material/Ink/Ink.image.html) widget.

Without it, images won't display tap animations.

```dart
InkWell(
  onTap: () => print('Image tapped'),
  child: Image.network(
    imageUrl,
    height: 400,
  ),
),
const SizedBox(height: 24),
InkWell(
  onTap: () => print('Ink image tapped'),
  child: Ink.image(
    height: 400,
    image: NetworkImage(imageUrl),
  ),
)
``` 