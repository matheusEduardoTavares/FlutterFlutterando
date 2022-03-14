import 'package:flutter/material.dart';
import 'package:unity_test_study/bloc_provider.dart';
import 'package:unity_test_study/person_bloc.dart';
import 'package:unity_test_study/person_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.get(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Person'),
        actions: [
          StreamBuilder<PersonState>(
            stream: bloc.stream,
            builder: (_, snapshot) {
              final isEnable = snapshot.data is PersonListState && (bloc.state as PersonListState).data.isNotEmpty;

              return IconButton(
                onPressed: isEnable ? () => 
                  bloc.add(PersonEvent.clear) : null, 
                icon: const Icon(Icons.refresh_outlined)
              );
            }
          )
        ],
      ),
      body: Center(
        child: StreamBuilder<PersonState>(
          stream: bloc.stream,
          builder: (_, snapshot) {
            if (bloc.state is PersonErrorState) {
              return _ErrorWidget();
            }
            else if (bloc.state is PersonLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return _ListWidget();
          },
        ),
      ),
    );
  }
}


class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.get(context);
    final textError = (bloc.state as PersonErrorState).error?.toString() ?? 'Unknown error';

    return Center(
      child: Text(textError),
    );
  }
}

class _ListWidget extends StatelessWidget {
  const _ListWidget({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.get(context);
    final listPerson = (bloc.state as PersonListState).data;
   
    if (listPerson.isEmpty) {
      return TextButton(
        key: ValueKey('TextButton 1'),
        onPressed: () => bloc.add(PersonEvent.fetch), 
        child: const Text('Fetch persons')
      );
    }

    return ListView.builder(
      itemCount: listPerson.length,
      itemBuilder: (_, index) => ListTile(
        title: Text(listPerson[index].name),
        subtitle: Text((listPerson[index].isOlder ? 'Maior' : 'Menor') + ' de idade'),
      ),
    );
  }
}