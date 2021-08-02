import 'dart:async';

void main(List<String> args) {
  final _streamController = StreamController<String>.broadcast();
  final _stream = _streamController.stream;
  final _transformedStream = _stream.map((string) => string.length);

  _stream.listen((data) {
    print('_stream data = $data');
  });

  _transformedStream.listen((data) {
    print('_transformedStream data = $data');
  });

  _streamController.add('minha string');
}