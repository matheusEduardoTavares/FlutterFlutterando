import 'package:unity_test_study/person.dart';

void main(List<String> arguments) {
  final person = Person(
    name: 'Matheus', 
    age: 21, 
    height: 1.70, 
    weight: 70.0,
  );

  print('A idade tem que ser 21: ${person.age == 21}');
  print('Imc deve vir 24.22: ${person.imc == 24.22}');
}

