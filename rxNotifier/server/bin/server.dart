import 'dart:io';

import 'package:socket_io/socket_io.dart';
import 'package:common/common.dart';

void main(List<String> arguments) {
  final server = Server();

  ///O socket_io escuta e envia eventos.
  ///O evento "connection" escuta todos os
  ///clientes que se conetam ao socket.
  server.on('connection', (client) {
    onConnection(client);
  });

  ///Variáveis de ambiente em Dart acessamos
  ///com o [Platform.environment] que é um map.
  server.listen(
    Platform.environment['PORT'] ?? 3000
  );
}

void onConnection(Socket socket) {
  socket.on('enter_room', (data) {
    ///Ao entrar na sala virá um map que 
    ///terá o nome e a sala que o usuário quer
    ///entrar
    final name = data['name'];
    final room = data['room'];

    ///Então faz o usuário entrar na sala
    socket.join(room);

    ///O usuário manda uma mensagem para a 
    ///sala que entrou, para todo mundo menos
    ///para ele (broadcast)
    socket.to(room).broadcast.emit(
      'message',
      SocketEvent(
        name: name, 
        room: room, 
        type: SocketEventType.enter_room,
      ).toJson(),
    );

    socket.on('disconnect', (data) {
      socket.to(room).broadcast.emit(
        'message',
        SocketEvent(
          name: name, 
          room: room, 
          type: SocketEventType.leave_room,
        ).toJson(),
      );
    });

    socket.on('message', (json) {
      socket.to(room).broadcast.emit(
        'message',
        json
      );
    });
  });
}