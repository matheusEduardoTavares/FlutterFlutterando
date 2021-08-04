import 'package:test/test.dart';
import '../bin/list_repository.dart';

void main() {
  var listRepository = ListRepository();

  ///Ciclo de vida de inicialização do teste, de forma que 
  ///no momento que cada teste for inicializado, o que 
  ///estiver no corpo deste setUp é executado
  setUp(() {
    listRepository = ListRepository();
  });

  test('List names filter', () {
    ///No TDD, primeiro construímos o teste de forma que 
    ///claramente irá dar erro. Aí finalizamos o modelo de 
    ///negócio de forma a fazer funcionar o teste. Depois 
    ///refatoramos o código do modelo de negócio para deixar
    ///o código o melhor possível, aí testamos novamente e 
    ///caso devido a mudança dê erro, aí é preciso adequar
    ///os testes.
    final listNames = listRepository.filter('Jacob');

    expect(listNames, ['Jacob']);
  });
}