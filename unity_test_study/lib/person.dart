import 'dart:convert';
import 'dart:math' as math;

class Person {
  Person({
    required this.id,
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
  });
  
  final int id;
  final String name;
  final int age;
  final double height;
  final double weight;

  double get imc {
    final result = weight / math.pow(height, 2);

    return double.parse(result.toStringAsFixed(2));
  }

  bool get isOlder => age >= 18;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'height': height,
      'weight': weight,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: int.tryParse(map['id']?.toString() ?? '') ?? 0,
      name: map['name'] ?? '',
      age: int.tryParse(map['age']?.toString() ?? '') ?? 0,
      height: map['height']?.toDouble() ?? 0.0,
      weight: map['weight']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source));
}
