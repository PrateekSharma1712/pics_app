import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:picsum_app/data/__mocks__/api_client_mock.dart';
import 'package:picsum_app/data/network/datasources/pic_remote_ds.dart';

import '../../../sample/pics_list_sample.dart';

void main() {
  late ApiClientMock mockApiClient;
  late PicRemoteDS picRemoteDS;

  setUpAll(() {
    mockApiClient = ApiClientMock();
    picRemoteDS = PicRemoteDSImpl(mockApiClient);
  });

  test('should fetch pics', () async {
    when(() => mockApiClient.get(any(), params: captureAny(named: "params")))
        .thenAnswer((_) {
      return responseMock;
    });

    final listOfPics = await picRemoteDS.fetchPics(page: 1);

    verify(() => mockApiClient.get('list', params: {'page': 1})).called(1);
    expect(listOfPics.length, 2);
    expect(listOfPics.first.id, '0');
  });
}
