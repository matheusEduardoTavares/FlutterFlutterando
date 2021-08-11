import 'package:app_client/controller.dart';
import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ///Usamos o [ValueNotifier] para separar a view
  ///da regra de negócio. Temos um package chamado
  ///RxNotifier que traz várias facilidades no uso
  ///do [ValueNotifier]. Basicamente o RxNotifier 
  ///deixa o [ValueNotifier] transparente. O 
  ///[ValueNotifier] não é uma gerência de estado,
  ///mas podemos gerenciar o estado do APP com
  ///ele. A transparência é dada quando não precisamos
  ///passar para o [valueListenable] do [ValueListenableBuilder]
  ///, ou seja, quando não precisamos definir quem
  ///é o objeto que queremos escutar as mudanças. Só de
  ///ter ele dentro do RxNotifier já é suficiente para que
  ///ele rebuilde sempre que altera

  // int _counter = 0;
  // var _counter = ValueNotifier<int>(0);

  // void _incrementCounter() {
  //   _counter.value++;
  // }

  final _controller = Controller();

  @override
  void initState() {
    super.initState();

    ///Outra forma de usar o [ValueNotifier], aqui
    ///escutamos na regra de negócio as mudanças, mas
    ///poderíamos por os valores direto nos Widgets 
    ///e assim escutar as mudanças direto na view
    // _controller.counter.addListener(() {
    //   print(_controller.counter.value);
    // });

    ///Usando o [RxNotifier] obtemos a 
    ///transparência aqui, de forma que 
    ///tudo que colocarmos dentro da função
    ///que passamos como parâmetro para a 
    ///função [rxObserver], ficará sendo 
    ///ouvido para ser atualizado. No caso,
    ///só de printar o [_controller.counter.value]
    ///já faz com que essa funçaõ seja disparada
    ///sempre que ele mude.
    rxObserver(() {
      print(_controller.counter.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            /*
            ValueListenableBuilder(
              // valueListenable: _counter, 
              valueListenable: _controller.counter, 
              builder: (_, value, __) => Text(
                // '$value',
                ///Dá na mesma usar:
                // '${_counter.value}',
                '${_controller.counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            */
            ///Usando o [RxNotifier] podemos 
            ///ter a transparência aqui na UI
            ///usando o [RxBuilder]
            RxBuilder(
              builder: (_) => Text(
                '${_controller.counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _controller.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
