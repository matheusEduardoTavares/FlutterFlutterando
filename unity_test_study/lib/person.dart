import 'dart:math' as math;

class Person {
  Person({
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
  });
  
  final String name;
  final int age;
  final double height;
  final double weight;

  double get imc {
    final result = weight / math.pow(height, 2);

    return double.parse(result.toStringAsFixed(2));
  }

  bool get isOlder => age >= 18;
}
