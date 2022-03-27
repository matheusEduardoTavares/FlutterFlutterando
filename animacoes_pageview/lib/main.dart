import 'dart:ui';

import 'package:animacoes_pageview/default_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = PageController(
    // viewportFraction: 0.8,
  );

  var isLoadedScreen = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      setState(() {
        isLoadedScreen = true;
      });

      _controller.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return PageView.builder(
            itemCount: 10,
            itemBuilder: (_, index) {
                var value = 0.0;
                var isLeftCard = true;

                if (isLoadedScreen) {
                  var currentPage = _controller.page ?? 0.0;
                  if (index <= currentPage.floor()) {
                    value = currentPage - index;
                    value = 1 - value;
                    isLeftCard = true;
                  }
                  else if (index > currentPage.floor()) {
                    value = index - currentPage;
                    value = 1 - value;
                    isLeftCard = false;
                  }

                  if (value < 0) {
                    value = 0.0;
                  }

                  print('value = $value');
                }

                // return Opacity(
                //   opacity: value,
                //   child: Container(
                //     color: index % 2 == 0 ? Colors.red : Colors.blue, 
                //     height: constraints.maxHeight,
                //   ),
                // );

                final rotateAnimation = lerpDouble(isLeftCard ? 0.87 : -0.87, 0, value)!;
                final scaleAnimation = lerpDouble(0, 1, value)!;
                final opacityAnimation = const Interval(0.5, 1).transformInternal(value);

                return Opacity(
                  opacity: opacityAnimation,
                  child: DefaultContainer(
                    color: index % 2 == 0 ? Colors.red : Colors.blue, 
                    height: constraints.maxHeight,
                    rotate: rotateAnimation,
                    scale: scaleAnimation,
                  ),
                );
            },
            controller: _controller,
          );
        }
      ),
    );
  }
}