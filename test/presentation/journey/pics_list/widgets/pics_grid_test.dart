import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:picsum_app/common/constants/duration_constants.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/__mocks__/pics_bloc_mock.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_bloc.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_event.dart';
import 'package:picsum_app/presentation/journey/pics_list/widgets/pic_mini_image.dart';
import 'package:picsum_app/presentation/journey/pics_list/widgets/pic_mini_shimmer.dart';
import 'package:picsum_app/presentation/journey/pics_list/widgets/pics_grid.dart';

import '../../../../sample/pic_dm_sample.dart';
import '../../../../utils/widget_builder.dart';

void main() {
  late PicsBloc picsBlocMock;
  late Widget widget;

  setUp(() {
    picsBlocMock = PicsBlocMock();
    widget = wrapWithMaterial(
      BlocProvider.value(
        value: picsBlocMock,
        child: PicsGrid(
          showShimmer: true,
          pics: [picDM],
          picsBloc: picsBlocMock,
          onItemTap: () {},
        ),
      ),
    );
  });

  testWidgets('should have default widgets', (tester) async {
    await tester.pumpWidget(widget);

    final grid = find.byType(GridView).evaluate().single.widget as GridView;

    expect(grid.semanticChildCount, 5);
    expect(grid.scrollDirection, Axis.vertical);
    expect(find.byType(GridView), findsOneWidget);
    expect(find.byType(PicMiniImage), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

  testWidgets('should not have PicMiniImage when initial loading',
      (tester) async {
    widget = wrapWithMaterial(PicsGrid(
      showShimmer: false,
      pics: List.empty(),
      picsBloc: picsBlocMock,
      onItemTap: () {},
    ));
    await tester.pumpWidget(widget);

    expect(find.byType(GridView), findsOneWidget);
    expect(find.byType(PicMiniImage), findsNothing);
    expect(find.byType(PicMiniShimmer), findsNothing);
  });

  testWidgets('should call loadMorePics when scroll to an extent',
      (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(600, 1200);
    final pics = List.generate(12, (index) => picDM);
    widget = wrapWithMaterial(PicsGrid(
      showShimmer: false,
      pics: List.from([...pics]),
      picsBloc: picsBlocMock,
      onItemTap: () {},
    ));
    await tester.pumpWidget(widget);

    final grid = find.byType(GridView).evaluate().single.widget as GridView;
    expect(grid.semanticChildCount, 12);
    expect(find.byType(GridView), findsOneWidget);

    final lastItem = find.byKey(const ValueKey('pic_mini_image_10'));
    expect(find.byType(Scrollable), findsOneWidget);

    await tester.scrollUntilVisible(
      lastItem,
      1800.0,
      scrollable: find.byType(Scrollable),
    );
    expect(lastItem, findsOneWidget);
    verify(() => picsBlocMock.add(const PicsEvent.loadMorePics())).called(1);
  });

  testWidgets('should scroll to top on FAB tap', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(600, 1200);
    final pics = List.generate(12, (index) => picDM);
    widget = wrapWithMaterial(PicsGrid(
      showShimmer: false,
      pics: List.from([...pics]),
      picsBloc: picsBlocMock,
      onItemTap: () {},
    ));
    await tester.pumpWidget(widget);
    final firstItem = find.byKey(const ValueKey('pic_mini_image_1'));
    final lastItem = find.byKey(const ValueKey('pic_mini_image_10'));
    final fabFinder = find.byType(FloatingActionButton);
    expect(firstItem, findsOneWidget);
    expect(lastItem, findsNothing);
    await tester.scrollUntilVisible(
      lastItem,
      1800.0,
      scrollable: find.byType(Scrollable),
    );

    expect(firstItem, findsNothing);
    expect(lastItem, findsOneWidget);

    await tester.tap(fabFinder);
    await tester.pumpAndSettle(durationMedium);
    expect(firstItem, findsOneWidget);
    expect(lastItem, findsNothing);
  });
}
