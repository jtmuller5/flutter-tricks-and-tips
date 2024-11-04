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

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

void main() {
  final earthWeight = 75.0; // kg
  
  for (final planet in Planet.values) {
    print("Your weight on ${planet.toString()}: "
        "${planet.surfaceWeight(earthWeight).toStringAsFixed(2)} N");
  }

  // Using the enum in a switch statement
  const favoritePlanet = Planet.mars;
  switch (favoritePlanet) {
    case Planet.earth:
      print("There's no place like home!");
    case Planet.mars:
      print("The Red Planet - a future home for humanity?");
    default:
      print("An interesting choice!");
  }
}