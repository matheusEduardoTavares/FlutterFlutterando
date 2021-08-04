import 'package:test/test.dart';
import '../bin/bloc.dart';

void main() {
  late Bloc bloc;

  setUp(() {
    bloc = Bloc();
  });

  test('Bloc send text and return list', () {
    ///Há outros emits além do normal e do [emitsInOrder].
    ///Dessa forma, podemos testar a Stream como se
    ///estivéssemos testando o .listen dela.
    expect(bloc.output, emitsInOrder([
      ['Jacob'], 
      ['Jacob', 'André'],
      ['Deivão', 'Vilson'],
    ]));

    bloc.input.add('Jacob');
    bloc.input.add('a');
    bloc.input.add('v');
  });
}