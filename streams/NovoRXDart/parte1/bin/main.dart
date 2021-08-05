// ignore: import_of_legacy_library_into_null_safe
import 'package:rxdart/rxdart.dart';

void main(List<String> args) {
  ///Há um bom tempo atrás tínhamos os [Observable] no [RxDart]
  ///para criar [Streams] "tunadas", ou seja, com mais métodos
  ///e atributos que as [Streams] padrão, e tínhamos o construtor
  ///just em que passávamos via parâmetro o dado inicial que
  ///será enviado para a Stream.
  Observable.just(1).listen((data) {
    print(data);
  });
  
  ///Mais alguns exemplos de uso de [Observable]:
  Observable.periodic(const Duration(seconds: 2), (d) {
    print('print de 2 em 2 segundos');
  });

  ///O [cmbineLatest] é outro construtor nomeado que serve
  ///para juntar 2 Streams, no caso abaixo para somar o valor
  ///passado para cada uma das Streams e retornar isso.
  Observable.combineLatest2(
    Observable.just(1), 
    Observable.just(1),
    (int streamA, int streamB) {
      return streamA + streamB;
    }
  ).listen((data) {
    print(data);
  });

  ///O * no async serve para que retornemos o tipo do dado ao 
  ///invés de retornar uma [Future]. O [yield] é como o 
  ///return, mas não ecerra a função, só vai adicionando na
  ///saída da stream os dados gerados, e é usado em conjunto
  ///com o async*, chamado de "generator's functions".
  Stream<String> explodeTextStream(String completeName) async* {
    for (var name in completeName.split(' ')) {
      yield name;
    }
  }

  final explode = Observable<String>.just('Jacob Araujo Moura');

  ///Um dos Operadores internos da Stream, que é o [switchMap],
  ///que a partir de um valor recebido cria uma [Stream] a partir
  ///dele.
  explode.switchMap((completeName) => explodeTextStream(completeName))
  .listen((data) {
    print(data); // Jacob, Araujo, Moura
  });

  ///Porém, em 2019 houve uma atualização tanto no flutter, quanto
  ///no dart quato também no RxDart, em que é possível fazer uma
  ///extensão do [Stream] e colocar assim tudo que tem há mais 
  ///no [Observable] dentro da [Stream]. Esses [Observable]
  ///eram usados na versão 0.22.6 do RxDart.
}