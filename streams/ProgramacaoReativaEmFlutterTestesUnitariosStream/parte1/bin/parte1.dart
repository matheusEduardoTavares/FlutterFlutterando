import 'package:rxdart/rxdart.dart';

///Essa lista pode ser chamada de serviços ou repositórios,
///é uma forma de separar consultas, dados vindos em outras 
///classes. Então além de fazer os testes vamos separar esse
///repository.
final list = [
  'Jacob', 'Deivão', 'Vilson', 'André',
];

void main(List<String> args) {
  ///Geralmente colocamos o $ no fim do nome de 
  ///variáveis que servem para controlar fluxos
  final listFilter$ = BehaviorSubject<String>();
  final input = listFilter$.sink;

  // ignore: omit_local_variable_types
  Stream<List<String>> output = listFilter$.stream.map((text) {
    text = text.toLowerCase();
    return list.where((item) => item.toLowerCase().contains(text)).toList();
  });

  output.listen(print);

  input.add('Jacob');
  input.add('a');
  input.add('A');

  ///Fazemos testes em um arquivos separado, é aí que
  ///o BLOC é interessante, pois ele deixa toda a 
  ///regra de negócio separada, facilitando que 
  ///façamos os testes unitários.
  ///Os testes unitários evitam a aparição de erros.
}