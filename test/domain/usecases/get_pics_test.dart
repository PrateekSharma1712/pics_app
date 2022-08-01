import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:picsum_app/domain/__mocks__/pic_repository_mock.dart';
import 'package:picsum_app/domain/entities/pic_list_request_params.dart';
import 'package:picsum_app/domain/repositories/pic_repository.dart';
import 'package:picsum_app/domain/usecases/get_pics.dart';

void main() {
  late GetPics getPics;
  late PicRepository picRepository;

  setUp(() {
    picRepository = PicRepositoryMock();
    getPics = GetPics(picRepository);
  });

  test('should call repository with params', () {
    when(() => picRepository.fetchPics(page: captureAny(named: "page")))
        .thenAnswer((_) async => Right(List.empty()));
    getPics(PicListRequestParams(1));
    verify(() => picRepository.fetchPics(page: 1)).called(1);
  });
}
