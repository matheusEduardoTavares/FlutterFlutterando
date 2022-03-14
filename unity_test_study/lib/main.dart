import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:unity_test_study/bloc_provider.dart';
import 'package:unity_test_study/home_page.dart';
import 'package:unity_test_study/person_bloc.dart';
import 'package:unity_test_study/person_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        bloc: PersonBloc(repository: PersonRepository(client: Client())),
        child: const HomePage(),
      ),
    );
  }
}