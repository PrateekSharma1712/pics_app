import 'package:flutter_test/flutter_test.dart';
import 'package:picsum_app/common/constants/string_constants.dart';
import 'package:picsum_app/domain/entities/app_error.dart';
import 'package:picsum_app/presentation/widgets/app_error_widget.dart';

import '../../utils/widget_builder.dart';

void main() {
  testWidgets('should show api error', (tester) async {
    final widget =
        wrapWithMaterial(const AppErrorWidget(appErrorType: AppErrorType.api));
    await tester.pumpWidget(widget);

    final textFinder = find.text(Strings.apiError);
    expect(textFinder, findsOneWidget);
  });

  testWidgets('should show network error', (tester) async {
    final widget = wrapWithMaterial(
        const AppErrorWidget(appErrorType: AppErrorType.network));
    await tester.pumpWidget(widget);

    final textFinder = find.text(Strings.noNetwork);
    expect(textFinder, findsOneWidget);
  });
}
