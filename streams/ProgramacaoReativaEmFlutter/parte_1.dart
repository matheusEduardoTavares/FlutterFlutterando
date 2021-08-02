import 'dart:async';

void main(List<String> args) {
  final _streamController = StreamController<String>();
  final _stream = _streamController.stream;
  final _transformedStream = _stream.map((string) => string.length);

  _stream.listen((data) {
    print('data = $data');
  });

  _streamController.add('minha string');

  try {
    _transformedStream.listen((data) {
      print('data = $data');
    });
  }
  catch (error) {
    print('error = $error'); //error = Bad state: Stream has already been listened to.
    ///Streams normais não podemos ter mais de um listener. Para ter mais de
    ///um listener, o [StreamController] deve ser um [broadcast]
  }
}