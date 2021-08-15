import 'package:common/common.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('from json to json', () {

    final json = {
      'name': 'Maria',
      'room': 'Sala 1',
      'text': '',
      'type': 'SocketEventType.enter_room',
    };

    final event = SocketEvent.fromJson(json);
    expect(event.name, 'Maria');
    expect(event.room, 'Sala 1');
    expect(event.text, '');
    expect(event.type, SocketEventType.enter_room);
    expect(event.toJson(), json);
  });
}