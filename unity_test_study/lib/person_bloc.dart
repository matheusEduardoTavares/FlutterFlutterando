import 'package:bloc/bloc.dart';
import 'package:unity_test_study/person_repository.dart';
import 'package:unity_test_study/person_state.dart';

enum PersonEvent {
  clear,
  fetch
}

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonRepository repository;

  PersonBloc({
    required this.repository,
  }) : super(PersonListState([])) {
      on<PersonEvent>((event, emit) async {
        if (event == PersonEvent.clear) {
          emit(PersonListState([]));
        }
        else if (event == PersonEvent.fetch) {
          try {
            emit(PersonLoadingState());
            
            final list = await repository.getPerson();
            
            emit(PersonListState(list));
          } catch (e) {
            emit(PersonErrorState(e));
          }
        }
      });
    }
}