import 'dart:async';

import 'package:flutter/material.dart';
import 'package:picsum_app/common/constants/route_constants.dart';
import 'package:picsum_app/common/constants/string_constants.dart';
import 'package:picsum_app/presentation/routes.dart';

import 'di/get_it.dart' as get_it;

void main() {
  unawaited(get_it.init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: RouteList.picsList,
      builder: (context, child) => child!,
      onGenerateRoute: (RouteSettings settings) {
        final routes = Routes.getRoutes(settings);
        final WidgetBuilder? builder = routes[settings.name];
        return MaterialPageRoute(
          builder: builder!,
          settings: settings,
        );
      },
    );
  }
}
