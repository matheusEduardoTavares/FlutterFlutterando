import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var size = 50.0;
  var x = 10.0;
  var y = 100.0;

  //O ticker faz o cálculo de frames
  Ticker _ticker;

  @override 
  void initState(){
    super.initState();

    _ticker = Ticker((now) {
      setState(() {});
    });
    _ticker.start();
  }

  @override 
  void dispose(){
    super.dispose();

    _ticker.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (y < MediaQuery.of(context).size.height - size){
      y += 1;
    }

    return Scaffold(
      body: Transform.translate(
        offset: Offset(x, y),
        child: Container(
          width: size,
          height: size,
          color: Colors.red
        ),
      )
    );
  }
}

//Uma animação pode ser entendida como
//a interpolação entre o estado inicial
//e o estado final de um elemento.