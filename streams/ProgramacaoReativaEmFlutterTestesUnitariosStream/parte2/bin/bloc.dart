import 'package:rxdart/rxdart.dart';

class Bloc {
  final listFilter$ = BehaviorSubject<String>();
  Sink get input => listFilter$.sink;

  Stream<List<String>> get output => listFilter$.stream.map((text) {
    final list = <String>[];
    text = text.toLowerCase();
    return list.where((item) => item.toLowerCase().contains(text)).toList();
  });
}