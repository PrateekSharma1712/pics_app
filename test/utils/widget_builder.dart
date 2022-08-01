import 'package:flutter/material.dart';
import 'package:mockingjay/mockingjay.dart';

Widget wrapWithMaterial(Widget widget) {
  return MediaQuery(
    data: const MediaQueryData(size: Size(600, 900)),
    child: MaterialApp(
      home: Scaffold(
        body: widget,
      ),
    ),
  );
}

Widget wrapWithMaterialWithNavigator(
  Widget widget,
  MockNavigator mockNavigator,
) {
  return MaterialApp(
    home: MockNavigatorProvider(
      navigator: mockNavigator,
      child: Scaffold(
        body: widget,
      ),
    ),
  );
}
