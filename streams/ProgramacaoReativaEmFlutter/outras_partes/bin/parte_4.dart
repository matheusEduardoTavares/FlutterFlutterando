import 'package:rxdart/subjects.dart';

void main(List<String> arguments) {
  ///Com Dart nativo temos apenas uma classe para controlar Streams, que é o 
  ///[StreamController]. Mas temos para Flutter um package chamado RxDart que
  ///traz 3 controladores de Streams, além de vários outros métodos. No
  ///[StreamController] padrão perdemos dados que são enviados para a Stream caso
  ///a subscrição na mesma vennha a ocorrer somente depois. 
  ///Mas, no RxDart temos o [BehaviorSubject] que é um dos três controladores
  ///de Streams, e esse controlador específico não perde o dado que foi enviado
  ///para a Stream mesmo que a subscrição seja feita depois, de forma que ao 
  ///assinar o ouvinte será refletido o último dado assinado.
  ///Por padrão o [BehaviorSubject] já é broadcast, então não precisa por o 
  ///.broadcast no [StreamController].
  // final _controller = StreamController<String>() as BehaviorSubject<String>;
  final _controller = BehaviorSubject<String>();
  final _stream = _controller.stream;
  final _transformedStream = _stream.map((string) => string.length);
  final _sink = _controller.sink;

  ///Agora mesmo adicionando novos dados antes da subscrição
  ///(listen), será printado os dados na tela
  _sink.add('minha string0');
  _sink.add('minha string1');
  ///Será printado neste caso somente:
  ///_stream data = minha string2
  ///_transformedStream data = 13
  ///Ou seja, o último dado a ser adicionado
  _sink.add('minha string2');

  _stream.listen((data) {
    print('_stream data = $data');
  });

  _transformedStream.listen((data) {
    print('_transformedStream data = $data');
  });
}
