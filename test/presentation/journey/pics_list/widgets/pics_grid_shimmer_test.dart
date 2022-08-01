import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:picsum_app/presentation/journey/pics_list/widgets/pic_mini_shimmer.dart';
import 'package:picsum_app/presentation/journey/pics_list/widgets/pics_grid_shimmer.dart';

import '../../../../utils/widget_builder.dart';

void main() {
  final widget = wrapWithMaterial(const PicsGridShimmer());

  testWidgets('should have Shimmer widget', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(600, 1200);
    await tester.pumpWidget(widget);
    final gridViewFinder = find.byType(GridView);

    final gridView = gridViewFinder.evaluate().single.widget as GridView;

    expect(gridViewFinder, findsOneWidget);
    expect(gridView.semanticChildCount, 8);
    expect(find.byType(PicMiniShimmer), findsNWidgets(8));
  });
}
