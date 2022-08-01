import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:picsum_app/presentation/journey/pics_list/widgets/pic_mini_image.dart';

import '../../../../sample/pic_dm_sample.dart';
import '../../../../utils/widget_builder.dart';

void main() {
  final widget = wrapWithMaterial(PicMiniImage(
    pic: picDM,
    imageWidth: 300,
    onTap: () {},
  ));

  testWidgets('should have InkWell widget', (tester) async {
    await tester.pumpWidget(widget);

    expect(find.byType(InkWell), findsOneWidget);
  });

  testWidgets('should have author name widget when author is not empty',
      (tester) async {
    await tester.pumpWidget(widget);

    expect(find.text(picDM.author), findsOneWidget);
  });

  testWidgets('should not have author name widget when author is empty',
      (tester) async {
    final widget = wrapWithMaterial(PicMiniImage(
      pic: picDMWithoutAuthor,
      imageWidth: 300,
      onTap: () {},
    ));
    await tester.pumpWidget(widget);

    expect(find.byKey(const ValueKey('author_name_key')), findsNothing);
  });
}
