import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:picsum_app/data/__mocks__/pic_remote_ds_mock.dart';
import 'package:picsum_app/data/network/datasources/pic_remote_ds.dart';
import 'package:picsum_app/data/network/models/pic_rm.dart';
import 'package:picsum_app/data/repositories/pic_repository_impl.dart';
import 'package:picsum_app/domain/entities/app_error.dart';
import 'package:picsum_app/domain/repositories/pic_repository.dart';

void main() {
  late PicRemoteDS picRemoteDS;
  late PicRepository picRepository;

  setUpAll(() {
    picRemoteDS = PicRemoteDSMock();
    picRepository = PicRepositoryImpl(picRemoteDS);
  });

  test('should fetch pics successfully', () async {
    when(() => picRemoteDS.fetchPics(page: captureAny(named: "page")))
        .thenAnswer((_) async {
      return List<PicRM>.empty();
    });
    final response = await picRepository.fetchPics(page: 1);

    expect(response.isRight(), isTrue);
  });

  test('should fetch pics with socket exception', () async {
    when(() => picRemoteDS.fetchPics(page: captureAny(named: "page")))
        .thenThrow(const SocketException(""));
    final eitherResponse = await picRepository.fetchPics(page: 1);
    final actual = eitherResponse.fold((l) => l, (r) => r) as AppError;

    expect(eitherResponse.isLeft(), isTrue);
    expect(actual.appErrorType, AppErrorType.network);
  });

  test('should fetch pics with exception', () async {
    when(() => picRemoteDS.fetchPics(page: captureAny(named: "page")))
        .thenThrow(Exception());
    final eitherResponse = await picRepository.fetchPics(page: 1);
    final actual = eitherResponse.fold((l) => l, (r) => r) as AppError;

    expect(eitherResponse.isLeft(), isTrue);
    expect(actual.appErrorType, AppErrorType.api);
  });
}
