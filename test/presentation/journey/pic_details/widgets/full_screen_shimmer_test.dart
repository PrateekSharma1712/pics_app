import 'package:flutter_test/flutter_test.dart';
import 'package:picsum_app/presentation/journey/pic_details/widgets/full_screen_shimmer.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/widget_builder.dart';

void main() {
  final widget = wrapWithMaterial(const FullScreenShimmer());

  testWidgets('should have Shimmer widget', (tester) async {
    await tester.pumpWidget(widget);
    final shimmerFinder = find.byType(Shimmer);

    expect(shimmerFinder, findsOneWidget);
  });
}
