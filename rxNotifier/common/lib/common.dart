library common;

class SocketEvent {
  SocketEvent({
    required this.name,
    required this.room,
    required this.type,
    this.text = '',
  });

  final String name;
  final String room;
  final String text;
  final SocketEventType type;

  Map toJson() {
    return {
      'name': name,
      'room': room,
      'text': text,
      'type': type.toString(),
    };
  }

  factory SocketEvent.fromJson(Map json) {
    return SocketEvent(
      name: json['name'], 
      room: json['room'], 
      text: json['text'], 
      type: SocketEventType.values.firstWhere(
        (element) => element.toString() == json['type']
      ),
    );
  }
}

enum SocketEventType {
  enter_room,
  leave_room,
  message
}