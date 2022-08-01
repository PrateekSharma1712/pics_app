import 'dart:convert';

import 'package:http/http.dart';
import 'package:picsum_app/data/network/api_constants.dart';

abstract class ApiClient {
  dynamic get(String path, {Map<dynamic, dynamic>? params});
}

class ApiClientImpl extends ApiClient {
  final Client _client;

  ApiClientImpl(this._client);

  @override
  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    final response = await _client.get(
      _getPath(path, params),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Uri _getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }

    final trimmedParams = paramsString.replaceFirst('&', '');

    return Uri.parse('${ApiConstants.baseUrl}$path?$trimmedParams');
  }
}
