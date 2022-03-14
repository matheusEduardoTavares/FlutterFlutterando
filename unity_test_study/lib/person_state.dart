import 'package:unity_test_study/person.dart';

abstract class PersonState {}

class PersonListState extends PersonState {
  PersonListState(
    this.data,
  );
  
  final List<Person> data;
}

class PersonLoadingState extends PersonState {}

class PersonErrorState extends PersonState {
  PersonErrorState([
    this.error,
  ]);

  final dynamic error;
}