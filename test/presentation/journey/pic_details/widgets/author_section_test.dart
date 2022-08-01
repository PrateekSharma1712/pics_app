import 'package:flutter_test/flutter_test.dart';
import 'package:picsum_app/presentation/journey/pic_details/widgets/author_section.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../utils/widget_builder.dart';

void main() {
  final widget = wrapWithMaterial(const AuthorSection(author: "Author name"));

  testWidgets('should have Shimmer widget and author name', (tester) async {
    await tester.pumpWidget(widget);
    final shimmerFinder = find.byType(Shimmer);
    final textFinder = find.text("BY: Author name");

    expect(shimmerFinder, findsOneWidget);
    expect(textFinder, findsOneWidget);
  });
}
