import 'package:animacoes/src/ball_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGrowing = false;
  double force = 20;

  final ballController = BallController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              ballController.setTranslate(x: ballController.x - force);
            },
            child: Icon(Icons.arrow_left),
          ),
          FloatingActionButton(
            onPressed: () {
              ballController.setTranslate(y: ballController.y - force);
            },
            child: Icon(Icons.arrow_upward),
          ),
          FloatingActionButton(
            onPressed: () {
              ballController.setTranslate(y: ballController.y + force);
            },
            child: Icon(Icons.arrow_downward),
          ),
          FloatingActionButton(
            onPressed: () {
              ballController.setTranslate(x: ballController.x + force);
            },
            child: Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: Center(
        //Assim temos um controle de estados
        //independente e o único widget a ser 
        //rebuildado é o AnimatedBuilder.
        child: AnimatedBuilder(
          animation: ballController,
          builder: (context, snapshot) {
            return AnimatedContainer(
              transform: Matrix4.identity()..translate(ballController.x, ballController.y),
              curve: ballController.curve,
              duration: ballController.duration,
              width: ballController.size,
              height: ballController.size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.red
              ),
            );
          }
        )
      )
    );
  }
}