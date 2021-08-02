import 'dart:async';

void main(List<String> args) {
  final _streamController = StreamController<String>.broadcast();
  final _stream = _streamController.stream;
  final _transformedStream = _stream.map((string) => string.length);
  final _sink = _streamController.sink;

  _stream.listen((data) {
    print('_stream data = $data');
  });

  _transformedStream.listen((data) {
    print('_transformedStream data = $data');
  });

  ///É o objeto [sink] que está dentro da [Stream] que na verdade é o responsável
  ///por adicionar dados na Stream, por enviar dados para ela, e o método add
  ///direto na Stream é só um alias para chamar o [add] dentro do [sink].
  // _streamController.sink.add('minha string');
  _sink.add('minha string1');
  _sink.add('minha string2');
}