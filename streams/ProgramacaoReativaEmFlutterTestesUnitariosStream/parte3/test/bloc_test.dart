import 'package:test/test.dart';
import '../bin/bloc.dart';

void main() {
  late Bloc bloc;

  setUp(() {
    bloc = Bloc();
  });

  test('Bloc send text and return list', () {
    bloc.input.add('Jacob');
    ///Em testes para streams usamos o [emits], de forma que
    ///tudo que pormos dentro dele é o que deve estar vindo
    ///no fluxo da stream
    expect(bloc.output, emits(['Jacob']));

    bloc.input.add('a');
    expect(bloc.output, emits(['Jacob', 'André']));

    ///Podemos testar várias emissões também.
  });
}