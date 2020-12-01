import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var startSize = 50.0;
  var endSize = 100.0;
  bool isGrowing = false;

  //Essa não é uma forma muito adequada de gerenciar
  //o estado desta aplicação, pois temos muita 
  //repetição de código nos 2 estados. 

  Widget _stateNormal(){
    //O Flutter reaproveita a key na árvore de elementos
    //de forma que mesmo que 2 AnimatedContainer
    //diferentes sejam renderizados, eles sejam o mesmo
    return AnimatedContainer(
      //se não passarmos o atributo key o flutter 
      //gera automaticamente ele, e gerará o mesmo 
      //key para esse animated container ou o do 
      //state grow pois será chamado no mesmo local
      //Se passarmos, se forem iguais surtirão efeito
      //no mesmo widget, se forem diferentes o 
      //flutter entenderá que são 2 widgets 
      //diferentes logo não terá + interpolação
      // key: ValueKey("key"),
      //Para garantir a mesma instância de 2 widgets
      //é só eles terem a mesma key.
      transform: Matrix4.identity()..translate(0.0, 0.0),
      duration: Duration(seconds: 2),
      width: startSize,
      height: startSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.red
      )
    );
  }

  Widget _stateGrow(){
    //O AnimatedContainer serve para animações 
    //explícitas, ou seja, que criamos na mão.
    return AnimatedContainer(
      // key: ValueKey("key 2"),
      transform: Matrix4.identity()..translate(0.0, -300.0),
      duration: Duration(seconds: 2),
      width: endSize,
      height: endSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.red
      )
    );
  }


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
        child: isGrowing ? _stateGrow() : _stateNormal(),
      )
    );
  }
}

//Uma animação pode ser entendida como
//a interpolação entre o estado inicial
//e o estado final de um elemento.