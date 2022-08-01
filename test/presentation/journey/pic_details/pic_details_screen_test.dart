import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:picsum_app/presentation/journey/pic_details/pic_details_screen.dart';
import 'package:picsum_app/presentation/journey/pic_details/widgets/author_section.dart';
import 'package:picsum_app/presentation/widgets/pic_app_bar.dart';

import '../../../sample/pic_dm_sample.dart';
import '../../../utils/widget_builder.dart';

void main() {
  late Widget widget;
  late MockNavigator mockNavigator;

  setUpAll(() {
    mockNavigator = MockNavigator();
    widget = wrapWithMaterialWithNavigator(
      PicDetailsScreen(arguments: PicDetailScreenArguments(picDM)),
      mockNavigator,
    );
  });

  testWidgets('should have image, app bar and author widget', (tester) async {
    await tester.pumpWidget(widget);
    final imageFinder = find.byType(CachedNetworkImage);
    final appBarFinder = find.byType(PicAppBar);
    final authorFinder = find.byType(AuthorSection);

    expect(imageFinder, findsOneWidget);
    expect(appBarFinder, findsOneWidget);
    expect(authorFinder, findsOneWidget);
  });

  testWidgets('should not have author widget', (tester) async {
    final widgetWithoutAuthor = wrapWithMaterial(PicDetailsScreen(
        arguments: PicDetailScreenArguments(picDMWithoutAuthor)));
    await tester.pumpWidget(widgetWithoutAuthor);
    final imageFinder = find.byType(CachedNetworkImage);
    final appBarFinder = find.byType(PicAppBar);
    final authorFinder = find.byType(AuthorSection);

    expect(imageFinder, findsOneWidget);
    expect(appBarFinder, findsOneWidget);
    expect(authorFinder, findsNothing);
  });

  testWidgets('should pop back on tap of back button', (tester) async {
    await tester.pumpWidget(widget);
    final iconButtonFinder = find.byType(IconButton);

    expect(iconButtonFinder, findsOneWidget);

    await tester.tap(iconButtonFinder);
    verify(() => mockNavigator.pop());
  });
}
