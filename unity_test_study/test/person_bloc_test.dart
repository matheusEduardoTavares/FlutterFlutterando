import 'package:mocktail/mocktail.dart';
import 'package:unity_test_study/person.dart';
import 'package:unity_test_study/person_bloc.dart';
import 'package:unity_test_study/person_repository.dart';
import 'package:unity_test_study/person_state.dart';
import 'package:flutter_test/flutter_test.dart';

import 'core/json_person.dart';

class MockRepository extends Mock implements PersonRepository {}

void main() {
  final repository = MockRepository();
  final bloc = PersonBloc(
    repository: repository,
  );

  test('deve retornar uma lista de person', () async {
    when(() => repository.getPerson()).thenAnswer((invocation) async => 
      JsonPerson.jsonReturn.map((e) => Person.fromMap(e)).toList()
    );

    ///Como as streams são assíncronas, devemos por 
    ///o expect antes do add
    // expect(bloc.stream, emitsInOrder([
    //   isA<PersonLoadingState>(),
    //   isA<PersonListState>(),
    // ]));

    bloc.add(PersonEvent.fetch);

    ///Ou então usar o expectLater. A diferença é
    ///que o expectLater é uma Future, então ele 
    ///vai aguardar as emissões do bloc antes de 
    ///continuar caso usemos um await nele
    // await expectLater(bloc.stream, emitsInOrder([
    //   isA<PersonLoadingState>(),
    //   isA<PersonListState>(),
    // ]));
  });

  test('deve disparar um erro', () async {
    when(() => repository.getPerson()).thenThrow(Exception());
    bloc.add(PersonEvent.fetch);

    await expectLater(bloc.stream, emitsInOrder([
      isA<PersonLoadingState>(),
      isA<PersonErrorState>(),
    ]));
  });
}

