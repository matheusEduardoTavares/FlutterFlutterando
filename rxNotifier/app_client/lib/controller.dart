import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

///Com [ValueNotifier] default:
// class Controller {
//   var counter = ValueNotifier<int>(0);

//   void incrementCounter() {
//     counter.value++;
//   }
// }

///Usando o [RxNotifier]
class Controller {
  ///Basta usar o método [asRx] que converte
  ///o [ValueNotifier] em um [RxNotifier]
  // var counter = ValueNotifier<int>(0).asRx();
  ///Ou instanciamos diretamente o [RxNotifier]
  var counter = RxNotifier<int>(0);

  void incrementCounter() {
    counter.value++;
  }
}