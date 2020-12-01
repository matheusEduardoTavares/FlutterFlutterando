import 'package:flutter/material.dart';

//Para gerenciar estado de fluxo podemos usar o 
//ChangeNotifier
class BallController extends ChangeNotifier {
  var size = 50.0;
  var x = 0.0;
  var y = 0.0;

  var curve = Curves.easeInOut;
  var duration = Duration(milliseconds: 500);

  setSize(double size) {
    this.size = size;
    //Notifica todos que ouve uma mudança
    notifyListeners();
  }

  setTranslate({double x, double y}) {
    if (x != null){
      this.x = x;
    }
    if (y != null){
      this.y = y;
    }
    notifyListeners();
  }
}