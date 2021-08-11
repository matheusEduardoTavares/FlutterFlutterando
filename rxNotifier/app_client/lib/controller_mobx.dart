import 'package:mobx/mobx.dart';

///Comparação do [RxNotifier] com o [MobX].
///O [MobX] tem um limite arquitetural que é 
///pertinente no que se refere a arquitetura,
///que é a questão de que no MobX é obrigatório
///ter uma [Action], então força ter uma ação 
///para poder fazer alguma alteração no dado.
///Mas tirando isso, o resto da lógica é a mesma.
///O [MobX] tem um gerenciamento de código usando
///o build runner para que não precisemos realmente
///definir uma instância de uma action no construtor
///ou com [late] no caso do NullSafety. COm o build runner
///é só por a anotation que o build runner se encarrega
///de por o método dentro da Action. O MobX faz a jogada
///de propósito de ter uma action e sem ela não permitir
///alterar os dados pois isso facilita a manutenção 
///posteriormente e também os logs, pois sabemos 
///exatamente qual o método que disparou uma reação 
///mudando um observable, assim quando usarmos o [spy] -
///observador de track do MobX, conseguimos exatamente
///saber se deu erro e onde foi. Em tracker o MobX é 
///muito superior ao bloc. Porém tem a complexidade 
///maior de colocar a action e entender seu funcionamento
///no MobX. O [BloC] também tem o [BlocObserver] para 
///questão de ajudar no log, mas não tem a questão de 
///poder nomear as actions como se tem no MobX.
class ControllerMobX {
  var counter = Observable<int>(0);
  Action incrementCounter;

  ControllerMobX() {
    ///Nome da action que é totalmente rastreável
    incrementCounter = Action(
      _incrementCounter,
      name: 'incrementCounter',
    );
  }

  void _incrementCounter() {
    counter.value++;
  }
}