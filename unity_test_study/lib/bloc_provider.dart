import 'package:flutter/widgets.dart';
import 'package:unity_test_study/person_bloc.dart';

class BlocProvider extends InheritedWidget {
  BlocProvider({
    required Widget child,
    required this.bloc,
  }) : super(child: child);

  final PersonBloc bloc;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return (oldWidget as BlocProvider).bloc.state != bloc.state;
  }

  static PersonBloc get(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<BlocProvider>();

    if (provider != null) {
      return provider.bloc;
    }

    throw Exception('Not found bloc');
  }
  
}