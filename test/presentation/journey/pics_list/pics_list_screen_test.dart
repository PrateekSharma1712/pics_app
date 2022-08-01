import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:picsum_app/common/constants/string_constants.dart';
import 'package:picsum_app/domain/entities/app_error.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/__mocks__/pics_bloc_mock.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_bloc.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_event.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_state.dart';
import 'package:picsum_app/presentation/journey/pics_list/pics_list_screen.dart';
import 'package:picsum_app/presentation/journey/pics_list/widgets/pics_grid.dart';
import 'package:picsum_app/presentation/journey/pics_list/widgets/pics_grid_shimmer.dart';

import '../../../sample/pic_dm_sample.dart';
import '../../../utils/widget_builder.dart';

void main() {
  late PicsBloc picsBlocMock;
  late Widget widget;
  late MockNavigator mockNavigator;

  setUp(() {
    picsBlocMock = PicsBlocMock();
    mockNavigator = MockNavigator();
    widget = wrapWithMaterialWithNavigator(
      BlocProvider<PicsBloc>.value(
        value: picsBlocMock,
        child: const PicsListScreen(),
      ),
      mockNavigator,
    );
  });

  testWidgets('should show shimmer on page load and fire loadPics event',
      (tester) async {
    when(() => picsBlocMock.state).thenAnswer((_) {
      return const PicsState.initial();
    });
    await tester.pumpWidget(widget);

    final picsGridShimmerFinder = find.byType(PicsGridShimmer);

    expect(picsGridShimmerFinder, findsOneWidget);
    verify(() => picsBlocMock.add(const PicsEvent.loadPics())).called(1);
  });

  testWidgets('should show pics grid on successfully fetching pics',
      (tester) async {
    when(() => picsBlocMock.state).thenAnswer((_) {
      return PicsState.loaded([picDM], isLoadingMore: false);
    });
    await tester.pumpWidget(widget);

    final picsGridFinder = find.byType(PicsGrid);

    expect(picsGridFinder, findsOneWidget);
  });

  testWidgets('should show error widget', (tester) async {
    when(() => picsBlocMock.state).thenAnswer((_) {
      return const PicsState.error(AppErrorType.api);
    });
    await tester.pumpWidget(widget);

    final textFinder = find.text(Strings.apiError);

    expect(textFinder, findsOneWidget);
  });

  testWidgets('should navigate to pic details screen', (tester) async {
    when(() => picsBlocMock.state).thenAnswer((_) {
      return PicsState.loaded([picDMWithSpecificId], isLoadingMore: false);
    });
    when(() => mockNavigator.pushNamed(any(),
        arguments: captureAny(named: "arguments"))).thenAnswer((_) async => {});
    await tester.pumpWidget(widget);

    final picMiniImageFinder =
        find.byKey(const ValueKey('pic_mini_image_inkwell_key_100'));
    expect(picMiniImageFinder, findsOneWidget);

    await tester.tap(picMiniImageFinder);

    verify(
      () => mockNavigator.pushNamed(any(),
          arguments: captureAny(named: "arguments")),
    );
  });
}
