import 'package:rxdart/rxdart.dart';

void main(List<String> args) {
  ///Ao trocar para a versão 0.23.1 ou superior do RxDart, já
  ///iria dar erro em todos aqueles [Observable] que estávamos
  ///usando, pois ele não existe mais para parâmetros e construtores.
  ///Para construtores estáticos usamos a classe [Rx], mas o
  ///método [just] não existe mais também. Uma alternativa ao
  ///[Observable.just] é o [Stream.value], além de outros 
  ///construtores que a Stream possui.
  
  Stream.value(1).listen((data) {
    print(data);
  });
  
  Stream.periodic(const Duration(seconds: 2), (d) {
    print('print de 2 em 2 segundos');
  });

  ///O [combineLatest] está no [RxDart]
  Rx.combineLatest2(
    Stream.value(1), 
    Stream.value(1),
    (int streamA, int streamB) {
      return streamA + streamB;
    }
  ).listen((data) {
    print(data);
  });

  Stream<String> explodeTextStream(String completeName) async* {
    for (var name in completeName.split(' ')) {
      yield name;
    }
  }

  final explode = Stream<String>.value('Jacob Araujo Moura');

  ///Devido as [Extensions], esses métodos há mais que tinha
  ///no [Observable] mas não tinha no [Stream] passaram a 
  ///ser colocados também no [Stream], até por isso foi 
  ///removido o [Observable].
  explode.switchMap((completeName) => explodeTextStream(completeName))
  .listen((data) {
    print(data); // Jacob, Araujo, Moura
  });

  ///Temos uma CLI própria para fazer a migração de um projeto
  ///usando [Observable] para as novas modificações, que 
  ///corresponde ao package rxdart_codemod. É só instalar essa
  ///CLI no dart de forma global e executar o comando e a própria
  ///CLI irá mudar para nós os casos que conseguir. No package
  ///tem os comandos necessários para executar, ensinando a 
  ///migrar do RxDart 22 para o 23. Após executar o comando para
  ///fazer a troca no arquivo do projeto, irá aparecer cada 
  ///mudança que ele deseja fazer, e aí via terminal concordamos
  ///com a mudança ou não, ou podemos só aceitar todas as mudanças
  ///sem vê-las.
}