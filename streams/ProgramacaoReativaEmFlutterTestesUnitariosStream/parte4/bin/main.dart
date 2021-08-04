import 'bloc.dart';

void main(List<String> args) {
  ///Uma vez com todos os testes feitos e passados 
  ///seguindo o fluxo do TDD, podemos de fato implementar
  ///a view que irá consumir aquele modelo de negócio

  final bloc = Bloc();
  bloc.output.listen(print);

  bloc.input.add('a');
}