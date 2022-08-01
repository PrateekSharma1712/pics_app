import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:picsum_app/data/network/api_client.dart';
import 'package:picsum_app/data/network/api_constants.dart';

import '../../sample/pics_list_sample.dart';

void main() {
  late ApiClient? apiClient;
  late Client httpMockClient;

  tearDown(() {
    httpMockClient.close();
    apiClient = null;
  });

  test('should handle 200 status code', () async {
    httpMockClient =
        MockClient((request) async => Response(json.encode(responseMock), 200));
    apiClient = ApiClientImpl(httpMockClient);

    final response = await apiClient?.get(
      ApiConstants.baseUrl,
      params: {'page': 1},
    );

    expect(response[0]['id'], '0');
  });

  test('should handle other status codes', () async {
    httpMockClient = MockClient((request) async =>
        Response(json.encode({}), 400, reasonPhrase: "Bad request"));
    apiClient = ApiClientImpl(httpMockClient);

    expect(() async => await apiClient?.get(ApiConstants.baseUrl),
        throwsA(isInstanceOf<Exception>()));
  });
}
