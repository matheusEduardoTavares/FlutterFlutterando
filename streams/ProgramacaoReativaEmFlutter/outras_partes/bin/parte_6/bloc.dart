import 'package:rxdart/rxdart.dart';

class Bloc {
  final _controller = BehaviorSubject<String>.seeded('texto inicial');
  Stream<String> get stream => _controller.stream;
  Stream<int> get transformedStream => stream.map((string) => string.length);
  Sink get sink => _controller.sink;

  void addText(String text) {
    sink.add(text);
  }
}