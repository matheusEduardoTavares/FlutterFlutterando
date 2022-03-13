import 'dart:convert';

import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:unity_test_study/person.dart';
import 'package:unity_test_study/person_bloc.dart';
import 'package:unity_test_study/person_repository.dart';
import 'package:unity_test_study/person_state.dart';

class MockRepository extends Mock implements PersonRepository {}

void main() {
  final repository = MockRepository();
  final bloc = PersonBloc(
    repository: repository,
  );

  test('deve retornar uma lista de person', () async {
    when(() => repository.getPerson()).thenAnswer((invocation) async => 
      jsonReturn.map((e) => Person.fromMap(e)).toList()
    );

    ///Como as streams são assíncronas, devemos por 
    ///o expect antes do add
    // expect(bloc.stream, emitsInOrder([
    //   isA<PersonLoadingState>(),
    //   isA<PersonListState>(),
    // ]));

    bloc.add(PersonEvent.fetch);

    ///Ou então usar o expectLater. A diferença é
    ///que o expectLater é uma Future, então ele 
    ///vai aguardar as emissões do bloc antes de 
    ///continuar caso usemos um await nele
    // await expectLater(bloc.stream, emitsInOrder([
    //   isA<PersonLoadingState>(),
    //   isA<PersonListState>(),
    // ]));
  });

  test('deve disparar um erro', () async {
    when(() => repository.getPerson()).thenThrow(Exception());
    bloc.add(PersonEvent.fetch);

    await expectLater(bloc.stream, emitsInOrder([
      isA<PersonLoadingState>(),
      isA<PersonErrorState>(),
    ]));
  });
}

const jsonReturn = [
  {
    "name": "Xander Lendner",
    "age": 63,
    "height": 36,
    "weight": 66,
    "id": "1"
  },
  {
    "name": "name 2",
    "age": 70,
    "height": 9,
    "weight": 92,
    "id": "2"
  },
  {
    "name": "name 3",
    "age": 20,
    "height": 46,
    "weight": 60,
    "id": "3"
  },
  {
    "name": "name 4",
    "age": 62,
    "height": 75,
    "weight": 11,
    "id": "4"
  },
  {
    "name": "name 5",
    "age": 1,
    "height": 81,
    "weight": 29,
    "id": "5"
  },
  {
    "name": "name 6",
    "age": 36,
    "height": 68,
    "weight": 20,
    "id": "6"
  },
  {
    "name": "name 7",
    "age": 76,
    "height": 7,
    "weight": 75,
    "id": "7"
  },
  {
    "name": "name 8",
    "age": 48,
    "height": 1,
    "weight": 53,
    "id": "8"
  },
  {
    "name": "name 9",
    "age": 25,
    "height": 49,
    "weight": 76,
    "id": "9"
  },
  {
    "name": "name 10",
    "age": 13,
    "height": 47,
    "weight": 7,
    "id": "10"
  },
  {
    "name": "name 11",
    "age": 30,
    "height": 5,
    "weight": 32,
    "id": "11"
  },
  {
    "name": "name 12",
    "age": 73,
    "height": 45,
    "weight": 68,
    "id": "12"
  },
  {
    "name": "name 13",
    "age": 8,
    "height": 33,
    "weight": 56,
    "id": "13"
  },
  {
    "name": "name 14",
    "age": 29,
    "height": 21,
    "weight": 3,
    "id": "14"
  },
  {
    "name": "name 15",
    "age": 87,
    "height": 40,
    "weight": 85,
    "id": "15"
  },
  {
    "name": "name 16",
    "age": 89,
    "height": 99,
    "weight": 73,
    "id": "16"
  },
  {
    "name": "name 17",
    "age": 88,
    "height": 60,
    "weight": 67,
    "id": "17"
  },
  {
    "name": "name 18",
    "age": 95,
    "height": 91,
    "weight": 16,
    "id": "18"
  },
  {
    "name": "name 19",
    "age": 63,
    "height": 95,
    "weight": 89,
    "id": "19"
  },
  {
    "name": "name 20",
    "age": 52,
    "height": 68,
    "weight": 26,
    "id": "20"
  },
  {
    "name": "name 21",
    "age": 71,
    "height": 44,
    "weight": 12,
    "id": "21"
  },
  {
    "name": "name 22",
    "age": 13,
    "height": 52,
    "weight": 66,
    "id": "22"
  },
  {
    "name": "name 23",
    "age": 54,
    "height": 84,
    "weight": 92,
    "id": "23"
  },
  {
    "name": "name 24",
    "age": 46,
    "height": 91,
    "weight": 80,
    "id": "24"
  },
  {
    "name": "name 25",
    "age": 50,
    "height": 92,
    "weight": 43,
    "id": "25"
  },
  {
    "name": "name 26",
    "age": 23,
    "height": 16,
    "weight": 10,
    "id": "26"
  },
  {
    "name": "name 27",
    "age": 96,
    "height": 52,
    "weight": 92,
    "id": "27"
  },
  {
    "name": "name 28",
    "age": 10,
    "height": 9,
    "weight": 75,
    "id": "28"
  },
  {
    "name": "name 29",
    "age": 6,
    "height": 12,
    "weight": 60,
    "id": "29"
  },
  {
    "name": "name 30",
    "age": 89,
    "height": 16,
    "weight": 16,
    "id": "30"
  },
  {
    "name": "name 31",
    "age": 60,
    "height": 87,
    "weight": 54,
    "id": "31"
  },
  {
    "name": "name 32",
    "age": 35,
    "height": 95,
    "weight": 7,
    "id": "32"
  },
  {
    "name": "name 33",
    "age": 10,
    "height": 17,
    "weight": 40,
    "id": "33"
  },
  {
    "name": "name 34",
    "age": 95,
    "height": 9,
    "weight": 43,
    "id": "34"
  },
  {
    "name": "name 35",
    "age": 68,
    "height": 47,
    "weight": 58,
    "id": "35"
  },
  {
    "name": "name 36",
    "age": 8,
    "height": 45,
    "weight": 5,
    "id": "36"
  },
  {
    "name": "name 37",
    "age": 90,
    "height": 12,
    "weight": 41,
    "id": "37"
  },
  {
    "name": "name 38",
    "age": 60,
    "height": 38,
    "weight": 21,
    "id": "38"
  },
  {
    "name": "name 39",
    "age": 52,
    "height": 37,
    "weight": 36,
    "id": "39"
  },
  {
    "name": "name 40",
    "age": 2,
    "height": 38,
    "weight": 79,
    "id": "40"
  },
  {
    "name": "name 41",
    "age": 81,
    "height": 58,
    "weight": 31,
    "id": "41"
  },
  {
    "name": "name 42",
    "age": 89,
    "height": 44,
    "weight": 16,
    "id": "42"
  },
  {
    "name": "name 43",
    "age": 83,
    "height": 96,
    "weight": 12,
    "id": "43"
  },
  {
    "name": "name 44",
    "age": 39,
    "height": 41,
    "weight": 81,
    "id": "44"
  },
  {
    "name": "name 45",
    "age": 73,
    "height": 38,
    "weight": 9,
    "id": "45"
  },
  {
    "name": "name 46",
    "age": 76,
    "height": 68,
    "weight": 91,
    "id": "46"
  },
  {
    "name": "name 47",
    "age": 27,
    "height": 52,
    "weight": 94,
    "id": "47"
  },
  {
    "name": "name 48",
    "age": 95,
    "height": 90,
    "weight": 55,
    "id": "48"
  },
  {
    "name": "name 49",
    "age": 5,
    "height": 85,
    "weight": 56,
    "id": "49"
  },
  {
    "name": "name 50",
    "age": 57,
    "height": 98,
    "weight": 62,
    "id": "50"
  },
  {
    "name": "name 51",
    "age": 91,
    "height": 65,
    "weight": 73,
    "id": "51"
  },
  {
    "name": "name 52",
    "age": 64,
    "height": 1,
    "weight": 10,
    "id": "52"
  },
  {
    "name": "name 53",
    "age": 85,
    "height": 100,
    "weight": 22,
    "id": "53"
  },
  {
    "name": "name 54",
    "age": 1,
    "height": 53,
    "weight": 48,
    "id": "54"
  },
  {
    "name": "name 55",
    "age": 90,
    "height": 55,
    "weight": 90,
    "id": "55"
  },
  {
    "name": "name 56",
    "age": 90,
    "height": 27,
    "weight": 52,
    "id": "56"
  },
  {
    "name": "name 57",
    "age": 88,
    "height": 2,
    "weight": 85,
    "id": "57"
  },
  {
    "name": "name 58",
    "age": 46,
    "height": 87,
    "weight": 82,
    "id": "58"
  },
  {
    "name": "name 59",
    "age": 70,
    "height": 78,
    "weight": 95,
    "id": "59"
  },
  {
    "name": "name 60",
    "age": 14,
    "height": 35,
    "weight": 75,
    "id": "60"
  },
  {
    "name": "name 61",
    "age": 57,
    "height": 74,
    "weight": 26,
    "id": "61"
  },
  {
    "name": "name 62",
    "age": 0,
    "height": 4,
    "weight": 96,
    "id": "62"
  },
  {
    "name": "name 63",
    "age": 52,
    "height": 67,
    "weight": 29,
    "id": "63"
  },
  {
    "name": "name 64",
    "age": 29,
    "height": 1,
    "weight": 70,
    "id": "64"
  },
  {
    "name": "name 65",
    "age": 96,
    "height": 2,
    "weight": 33,
    "id": "65"
  },
  {
    "name": "name 66",
    "age": 88,
    "height": 99,
    "weight": 53,
    "id": "66"
  },
  {
    "name": "name 67",
    "age": 58,
    "height": 56,
    "weight": 86,
    "id": "67"
  },
  {
    "name": "name 68",
    "age": 80,
    "height": 1,
    "weight": 59,
    "id": "68"
  },
  {
    "name": "name 69",
    "age": 21,
    "height": 14,
    "weight": 49,
    "id": "69"
  },
  {
    "name": "name 70",
    "age": 98,
    "height": 3,
    "weight": 52,
    "id": "70"
  },
  {
    "name": "name 71",
    "age": 64,
    "height": 11,
    "weight": 10,
    "id": "71"
  },
  {
    "name": "name 72",
    "age": 41,
    "height": 75,
    "weight": 97,
    "id": "72"
  },
  {
    "name": "name 73",
    "age": 42,
    "height": 71,
    "weight": 78,
    "id": "73"
  },
  {
    "name": "name 74",
    "age": 81,
    "height": 71,
    "weight": 8,
    "id": "74"
  },
  {
    "name": "name 75",
    "age": 87,
    "height": 48,
    "weight": 66,
    "id": "75"
  },
  {
    "name": "name 76",
    "age": 1,
    "height": 40,
    "weight": 14,
    "id": "76"
  },
  {
    "name": "name 77",
    "age": 76,
    "height": 78,
    "weight": 77,
    "id": "77"
  },
  {
    "name": "name 78",
    "age": 27,
    "height": 80,
    "weight": 44,
    "id": "78"
  },
  {
    "name": "name 79",
    "age": 75,
    "height": 10,
    "weight": 33,
    "id": "79"
  },
  {
    "name": "name 80",
    "age": 6,
    "height": 41,
    "weight": 76,
    "id": "80"
  },
  {
    "name": "name 81",
    "age": 39,
    "height": 49,
    "weight": 79,
    "id": "81"
  },
  {
    "name": "name 82",
    "age": 8,
    "height": 72,
    "weight": 86,
    "id": "82"
  },
  {
    "name": "name 83",
    "age": 13,
    "height": 47,
    "weight": 51,
    "id": "83"
  },
  {
    "name": "name 84",
    "age": 89,
    "height": 26,
    "weight": 78,
    "id": "84"
  },
  {
    "name": "name 85",
    "age": 66,
    "height": 86,
    "weight": 93,
    "id": "85"
  },
  {
    "name": "name 86",
    "age": 25,
    "height": 58,
    "weight": 39,
    "id": "86"
  },
  {
    "name": "name 87",
    "age": 82,
    "height": 44,
    "weight": 16,
    "id": "87"
  },
  {
    "name": "name 88",
    "age": 93,
    "height": 21,
    "weight": 98,
    "id": "88"
  },
  {
    "name": "name 89",
    "age": 49,
    "height": 8,
    "weight": 74,
    "id": "89"
  },
  {
    "name": "name 90",
    "age": 53,
    "height": 27,
    "weight": 56,
    "id": "90"
  },
  {
    "name": "name 91",
    "age": 14,
    "height": 55,
    "weight": 35,
    "id": "91"
  },
  {
    "name": "name 92",
    "age": 68,
    "height": 86,
    "weight": 27,
    "id": "92"
  },
  {
    "name": "name 93",
    "age": 47,
    "height": 78,
    "weight": 78,
    "id": "93"
  },
  {
    "name": "name 94",
    "age": 79,
    "height": 85,
    "weight": 80,
    "id": "94"
  },
  {
    "name": "name 95",
    "age": 58,
    "height": 16,
    "weight": 57,
    "id": "95"
  },
  {
    "name": "name 96",
    "age": 41,
    "height": 34,
    "weight": 77,
    "id": "96"
  },
  {
    "name": "name 97",
    "age": 55,
    "height": 3,
    "weight": 83,
    "id": "97"
  },
  {
    "name": "name 98",
    "age": 29,
    "height": 76,
    "weight": 93,
    "id": "98"
  },
  {
    "name": "name 99",
    "age": 43,
    "height": 39,
    "weight": 20,
    "id": "99"
  },
  {
    "name": "name 100",
    "age": 3,
    "height": 19,
    "weight": 25,
    "id": "100"
  }
];