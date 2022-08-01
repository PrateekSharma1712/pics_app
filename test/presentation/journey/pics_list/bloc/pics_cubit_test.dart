import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:picsum_app/domain/__mocks__/get_pics_mock.dart';
import 'package:picsum_app/domain/entities/app_error.dart';
import 'package:picsum_app/domain/entities/pic_dm.dart';
import 'package:picsum_app/domain/entities/pic_list_request_params.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_bloc.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_event.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_state.dart';

void main() {
  group(
    'Pics Cubit',
    () {
      late PicsBloc picsBloc;
      late GetPicsMock getPicsMock;

      setUp(() {
        getPicsMock = GetPicsMock();
        picsBloc = PicsBloc(getPicsMock);
        registerFallbackValue(PicListRequestParams(1));
      });

      test('should set initial state', () {
        expect(picsBloc.state, const PicsState.initial());
      });

      blocTest(
        'emits [loaded] when [LoadPics] is added',
        build: () {
          when(() => getPicsMock.call(any()))
              .thenAnswer((_) async => Right(List<PicDM>.empty()));
          return picsBloc;
        },
        act: (PicsBloc bloc) => bloc.add(const PicsEvent.loadPics()),
        expect: () => [
          PicsState.loaded(List<PicDM>.empty(), isLoadingMore: false),
        ],
      );

      blocTest(
        'emits [error] when [LoadPics] is added',
        build: () {
          when(() => getPicsMock.call(any()))
              .thenAnswer((_) async => Left(AppError(AppErrorType.api)));
          return picsBloc;
        },
        act: (PicsBloc bloc) => bloc.add(const PicsEvent.loadPics()),
        expect: () => [
          const PicsState.error(AppErrorType.api),
        ],
      );

      blocTest('emits [loaded] when [LoadMorePics] is added',
          build: () {
            when(() => getPicsMock.call(any()))
                .thenAnswer((_) async => Right(List<PicDM>.empty()));
            return picsBloc;
          },
          act: (PicsBloc bloc) {
            bloc.add(const PicsEvent.loadMorePics());
          },
          expect: () => [
                PicsState.loaded(List<PicDM>.empty(), isLoadingMore: true),
              ],
          verify: (_) {
            verify(() => getPicsMock.call(any())).called(1);
          });

      blocTest(
          'emits [loaded] state once when [LoadMorePics] is added frequently',
          build: () {
            when(() => getPicsMock.call(any()))
                .thenAnswer((_) async => Right(List<PicDM>.empty()));
            return picsBloc;
          },
          act: (PicsBloc bloc) {
            bloc.add(const PicsEvent.loadMorePics());
            bloc.add(const PicsEvent.loadMorePics());
          },
          expect: () => [
                PicsState.loaded(List<PicDM>.empty(), isLoadingMore: true),
              ],
          verify: (_) {
            verify(() => getPicsMock.call(any())).called(1);
          });
    },
  );
}
