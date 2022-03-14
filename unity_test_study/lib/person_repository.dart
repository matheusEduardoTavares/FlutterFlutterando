import 'dart:convert';

import 'package:http/http.dart';
import 'package:unity_test_study/person.dart';

class PersonRepository {
  PersonRepository({
    required this.client,
  });

  final Client client;

  Future<List<Person>> getPerson() async {
    final response = await client.get(
      Uri.parse('https://622d32c63f521675013ad38c.mockapi.io/person'),
    );

    if (response.statusCode == 200) {
      final List jsonList = jsonDecode(response.body);

      return jsonList.map((e) => Person.fromMap(e)).toList();
    } else {
      throw Exception('Erro na internet');
    }
  }
}