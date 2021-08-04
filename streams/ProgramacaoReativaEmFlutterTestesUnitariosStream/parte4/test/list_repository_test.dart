import 'package:test/test.dart';
import '../bin/list_repository.dart';

void main() {
  var listRepository = ListRepository();
  setUp(() {
    listRepository = ListRepository();
  });

  test('List names filter', () {
    expect(listRepository.filter('Jacob'), ['Jacob']);
    expect(listRepository.filter('a'), ['Jacob', 'André']);
  });
}