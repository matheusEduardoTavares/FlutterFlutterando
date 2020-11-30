import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var startSize = 50.0;
  var endSize = 100.0;
  bool isGrowing = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isGrowing = !isGrowing;
          });
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        //animações ímplicitas = tudo já está sendo
        //feito internamente. Há vários widgets desse
        //que se iniciam com Animated
        child: AnimatedContainer(
          // o Matrix4.identity deixa identado 
          //no centro do widget de layout pai, no
          //caso o center, então esse elemento
          //será identado ao centro da tela
          //Uma forma de transladar:
          transform: Matrix4.identity()..translate(0.0, -300.0),
          //usamos o .. para de uma mesma instância executar
          //2 métodos.
          duration: Duration(seconds: 2),
          width: isGrowing ? endSize : startSize,
          height: isGrowing ? endSize : startSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.red
          )
        ),
      )
    );
  }
}

//Uma animação pode ser entendida como
//a interpolação entre o estado inicial
//e o estado final de um elemento.