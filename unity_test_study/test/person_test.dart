import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:unity_test_study/person.dart';

void main() {
  final person = Person(
    name: 'Matheus', 
    age: 21, 
    height: 1.70, 
    weight: 70.0,
  );

  // print('A idade tem que ser 21: ${person.age == 21}');
  
  test('Imc deve vir 24.22', () {
    expect(person.imc, isA<double>());
    expect(person.imc, 24.22);
  });

  test('Se a idade for igual a 18, então isOlder deve ser true', () {
    final person = Person(
      name: 'Matheus', 
      age: 18, 
      height: 1.70, 
      weight: 70.0,
    );

    expect(person.isOlder, true);
  });
}