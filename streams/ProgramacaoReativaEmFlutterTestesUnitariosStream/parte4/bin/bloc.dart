import 'package:rxdart/rxdart.dart';

import 'list_repository.dart';

class Bloc {
  final _listRepository = ListRepository();

  final listFilter$ = BehaviorSubject<String>();
  Sink get input => listFilter$.sink;
  Stream<List<String>> get output => listFilter$.stream.map(
    _listRepository.filter,
  );
}