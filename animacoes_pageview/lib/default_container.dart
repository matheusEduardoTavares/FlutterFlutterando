import 'package:flutter/material.dart';

class DefaultContainer extends StatelessWidget {
  const DefaultContainer({ 
    required this.color,
    required this.height,
    required this.rotate,
    required this.scale,
    Key? key
  }) : super(key: key);

  final Color color;
  final double height;
  final double rotate;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..rotateZ(rotate)
        ..scale(scale),
      child: Container(
        height: height,
        width: double.infinity,
        color: color,
      ),
    );
  }
}