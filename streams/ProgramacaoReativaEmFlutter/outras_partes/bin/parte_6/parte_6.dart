import 'bloc.dart';

void main(List<String> arguments) {
  final bloc = Bloc();

  bloc.stream.listen((data) {
    print('stream data = $data');
  });

  bloc.transformedStream.listen((data) {
    print('transformedStream data = $data');
  });

  bloc.addText('Texto enviado via BLoC');
}
