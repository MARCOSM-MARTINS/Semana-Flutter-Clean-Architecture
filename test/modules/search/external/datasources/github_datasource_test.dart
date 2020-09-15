import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/modules/search/domain/errors/errors.dart';
import 'package:github_search/modules/search/external/datasources/github_datasource.dart';
import 'package:mockito/mockito.dart';

import '../../utils/github_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = GithubDatasource(dio);

  test("deve retornar uma lista de ResultSearchModel", () {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: jsonDecode(GITHUB_RESULT), statusCode: 200));
    final future = datasource.getSearch("text");
    expect(future, completes);
  });

  test("deve retornar um DataSourceError se o código não for 200", () {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: null, statusCode: 401));
    final future = datasource.getSearch("text");
    expect(future, throwsA(isA<DataSourceError>()));
  });
}
