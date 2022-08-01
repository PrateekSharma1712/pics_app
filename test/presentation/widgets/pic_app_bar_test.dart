import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:picsum_app/presentation/widgets/pic_app_bar.dart';

import '../../utils/widget_builder.dart';

void main() {
  const leadingWidgetKey = ValueKey('app_bar_leading_parent_key');

  final widget = wrapWithMaterial(PicAppBar(
    leading: const Icon(Icons.arrow_back, key: leadingWidgetKey,),
    title: "Title",
  ));

  testWidgets('should have basic elements', (tester) async {
    await tester.pumpWidget(widget);
    final appBarFinder = find.byType(AppBar);
    final paddingFinder = find.byKey(leadingWidgetKey);
    final titleFinder = find.text("TITLE");

    expect(appBarFinder, findsOneWidget);
    expect(paddingFinder, findsOneWidget);
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('should not have leading widget', (tester) async {
    final withoutLeadingWidget = wrapWithMaterial(PicAppBar());

    await tester.pumpWidget(withoutLeadingWidget);
    final paddingFinder = find.byKey(leadingWidgetKey);

    expect(paddingFinder, findsNothing);
  });
}
