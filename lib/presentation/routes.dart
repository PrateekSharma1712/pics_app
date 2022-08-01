import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsum_app/common/constants/route_constants.dart';
import 'package:picsum_app/di/get_it.dart';
import 'package:picsum_app/presentation/journey/pic_details/pic_details_screen.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_bloc.dart';
import 'package:picsum_app/presentation/journey/pics_list/pics_list_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.picsList: (context) => BlocProvider<PicsBloc>.value(
              value: getItInstance<PicsBloc>(),
              child: const PicsListScreen(),
            ),
        RouteList.picDetails: (context) => PicDetailsScreen(
            arguments: setting.arguments as PicDetailScreenArguments),
      };
}
