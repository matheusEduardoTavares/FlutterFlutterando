@Timeout(Duration(seconds: 60))
// @Skip('Reason to skip')
// @Tags(['web'])

import 'package:flutter_test/flutter_test.dart';

void main() {
  ///O timeout de um suite é de 30 segundos,
  ///e caso tenhamos algum teste que seja
  ///demorado, podemos aumentar esse timeout,
  ///que é um parâmetro nomeado que podemos
  ///passar no test, no group ou direto 
  ///no suite fazendo uso de annotations.
  ///Não pode haver comentários de teste
  ///dentro da switch. Caso precisemos por
  ///algum motivo pular algum teste ou 
  ///alguma suite de teste, podemos passar
  ///o atributo skip para o test, para o
  ///group, ou como annotation para a suite.
  ///Temos as tags em que podemos nomear 
  ///os tests, os groups e as suites, de 
  ///forma que na hora de executar os testes,
  ///podemos filtrar para executar algumas
  ///tags específicas ou para ignorar 
  ///algumas tags específicas. Podemos
  ///também filtrar os testes a serem 
  ///executados usando o parâmetro -p, ex:
  ///dart test -p chrome
  ///Para filtrar testes por tags:
  ///dart test -p chrome -t web
  ///E para executar todos os testes menos
  ///os que possuam dada tag:
  ///dart test -x web
  /*
    ///Ciclo de vida dos testes
    setUpAll(() {
      print('Iniciou suite de testes');
    });

    tearDownAll(() {
      print('Finalizou suite de testes');
    });

    setUp(() {
      print('Inicia o teste');
    });

    tearDown(() {
      print('Destrói o teste');
    });

    test('is worked', () {
      print('Executando');
    });

    test('is worked 2', () {
      print('Executando 2');
    });
  */

  ///Matchers
  test('is worked', () {
    final name = 'Jacob';

    ///Assim o matcher é feito por regex,
    ///o ideal é usarmos matchers para 
    ///comparar
    // expect(name, 'Jacob');
    ///Então o ideal é fazer assim:
    expect(name, equals('Jacob'));

    expect(name, isA<String>());
    expect(name, isNotNull);
    expect(name, contains('ac'));

    ///Ao invés de por todos expect separados,
    ///podemos juntá-los usando o allOf
    expect(name, allOf([
      equals('Jacob'),
      isA<String>(),
      isNotNull,
      contains('ac'),
    ]));
  },
  timeout: Timeout(const Duration(seconds: 60)),
  );

  test('throw error', () {
    expect(
      () => int.parse('x'), 
      throwsException
    );

    expect(
      () => int.parse('x'), 
      ///Para exceptions que ainda não
      ///tem matcher próprios
      throwsA(isA<Exception>())
    );
  },
  tags: 'web'
  );

  test('Teste que será pulado', () {
    expect(
      () => int.parse('x'), 
      throwsException
    );
  }, 
  skip: 'Falta terminar os casos de teste');
}