import 'package:rxdart/subjects.dart';

void main(List<String> arguments) {
  ///Temos o construtor nomeado seeded que já envia um dado ao
  ///criar o controlador. Ou seja, por padrão esse texto 
  ///estará no buffer do controlador. É sempre mantido o 
  ///buffer apenas do último dado.
  final _controller = BehaviorSubject<String>.seeded('texto inicial');
  final _stream = _controller.stream;
  final _transformedStream = _stream.map((string) => string.length);
  // final _sink = _controller.sink;
  // _sink.add('minha string0');
  // _sink.add('minha string1');
  // _sink.add('minha string2');

  _stream.listen((data) {
    print('_stream data = $data');
  });

  _transformedStream.listen((data) {
    print('_transformedStream data = $data');
  });
}
