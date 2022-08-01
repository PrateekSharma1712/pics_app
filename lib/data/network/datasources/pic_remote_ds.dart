import 'package:picsum_app/data/network/api_client.dart';
import 'package:picsum_app/data/network/models/pic_rm.dart';

abstract class PicRemoteDS {
  Future<List<PicRM>> fetchPics({int page});
}

class PicRemoteDSImpl extends PicRemoteDS {
  final ApiClient _apiClient;

  PicRemoteDSImpl(this._apiClient);

  @override
  Future<List<PicRM>> fetchPics({int page = 1}) async {
    final response = await _apiClient.get(
      "list",
      params: {'page': page},
    );
    final List<dynamic> output = response as List<dynamic>;
    final newOutput = output.map((entry) => PicRM.fromJson(entry)).toList();
    return newOutput;
  }
}
