import 'package:flutter_test/flutter_test.dart';
import 'package:picsum_app/presentation/journey/pics_list/widgets/pic_mini_shimmer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/widget_builder.dart';

void main() {
  final widget = wrapWithMaterial(const PicMiniShimmer());

  testWidgets('should have Shimmer widget', (tester) async {
    await tester.pumpWidget(widget);
    final shimmerFinder = find.byType(Shimmer);

    expect(shimmerFinder, findsOneWidget);
  });
}
