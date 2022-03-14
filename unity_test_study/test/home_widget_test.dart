import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unity_test_study/bloc_provider.dart';
import 'package:unity_test_study/home_page.dart';
import 'package:unity_test_study/person.dart';

import 'package:unity_test_study/person_bloc.dart';
import 'package:unity_test_study/person_repository.dart';

import 'core/json_person.dart';

class PersonRepositoryMock extends Mock implements PersonRepository {}

void main() {
  late PersonRepository repository;
  late PersonBloc bloc;

  setUp(() {
    repository = PersonRepositoryMock();
    bloc = PersonBloc(repository: repository);
  });

  testWidgets('Deve mostrar todos os estados na tela', (WidgetTester tester) async {
    when(() => repository.getPerson()).thenAnswer((_) async => 
      JsonPerson.jsonReturn.map((e) => Person.fromMap(e)).toList()
    );

    await tester.pumpWidget(MaterialApp(
      home: BlocProvider(
        bloc: bloc,
        child: const HomePage(),
      ),
    ));

    // final textButton = find.byType(TextButton);
    final textButton = find.byKey(ValueKey(('TextButton 1')));

    expect(textButton, findsOneWidget);

    final loading = find.byType(CircularProgressIndicator);
    expect(loading, findsNothing);

    final listPerson = find.byType(ListView);
    expect(listPerson, findsNothing);

    ///Pumps é um pulo para o próximo frame
    
    ///Clicar em um botão
    // await tester.tap(textButton);
    ///Dá erro nesse expect se fizer apenas assim,
    ///pois ao trocar de estado devemos informar que
    ///queremos ir para o próximo frame, se não não 
    ///irá ocorrer a troca dos widgets. Fazemos essa 
    ///espera com o método pump do tester.
    // expect(loading, findsOneWidget)

    // await tester.tap(textButton);
    ///Ainda dará erro, mas agora o erro é por estarmos
    ///usando streams especificamente (de baixo dos 
    ///panos o BLoC usa streams). Devido a questão de 
    ///concorrência, mesmo com o pump leva um pouco mais
    ///de tempo para de fato trocar o estado. Poderíamos
    ///usar um Future.delayed para tratar isso, mas não
    ///é o ideal. Então vamos trabalhar com o bloc.
    ///Só colocar await bloc.stream.first; não resolve
    ///pois ficaremos aqui travado eternamente devido
    ///a questão de concorrência.
    // await bloc.stream.first;
    ///Forma correta de resolver:

    ///Basta pedir para o tester só continuar quando
    ///determinada future for executada, e assim 
    ///ele não ficará travado eternamente
    tester.tap(textButton);
    await tester.runAsync(() => bloc.stream.first);
    await tester.pump();
    expect(loading, findsOneWidget);
  });

  testWidgets('Deve carregar a lista', (WidgetTester tester) async {
    when(() => repository.getPerson()).thenAnswer((_) async => 
      JsonPerson.jsonReturn.map((e) => Person.fromMap(e)).toList()
    );

    await tester.pumpWidget(MaterialApp(
      home: BlocProvider(
        bloc: bloc,
        child: const HomePage(),
      ),
    ));

    final textButton = find.byType(TextButton);
    final listView = find.byType(ListView);

    await tester.tap(textButton);
    await tester.runAsync(() => bloc.stream.first);
    await tester.pump();
    expect(listView, findsOneWidget);
  });
}
