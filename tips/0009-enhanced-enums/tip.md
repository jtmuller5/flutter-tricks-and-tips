# Enhanced Enums

You can use enhanced enums to create more powerful enums. In the example below, we define a `Planet` enum with a constructor that takes named parameters for `mass` and `radius`. We also define a `surfaceGravity` getter and a `surfaceWeight` method.

```dart
enum Planet {
  mercury(mass: 3.303e23, radius: 2.4397e6),
  venus(mass: 4.869e24, radius: 6.0518e6),
  earth(mass: 5.976e24, radius: 6.37814e6),
  mars(mass: 6.421e23, radius: 3.3972e6),
  jupiter(mass: 1.9e27, radius: 7.1492e7),
  saturn(mass: 5.688e26, radius: 6.0268e7),
  uranus(mass: 8.686e25, radius: 2.5559e7),
  neptune(mass: 1.024e26, radius: 2.4746e7);

  final double mass; // in kilograms
  final double radius; // in meters

  const Planet({required this.mass, required this.radius});

  double get surfaceGravity => 6.67430e-11 * mass / (radius * radius);

  double surfaceWeight(double massKg) => massKg * surfaceGravity;

  @override
  String toString() => name.capitalize();
}
```