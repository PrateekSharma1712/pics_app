import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsum_app/common/constants/route_constants.dart';
import 'package:picsum_app/common/constants/string_constants.dart';
import 'package:picsum_app/presentation/journey/pic_details/pic_details_screen.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_bloc.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_event.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_state.dart';
import 'package:picsum_app/presentation/journey/pics_list/widgets/pics_grid.dart';
import 'package:picsum_app/presentation/journey/pics_list/widgets/pics_grid_shimmer.dart';
import 'package:picsum_app/presentation/widgets/app_error_widget.dart';
import 'package:picsum_app/presentation/widgets/pic_app_bar.dart';

class PicsListScreen extends StatelessWidget {
  const PicsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final picsBloc = context.read<PicsBloc>();
    picsBloc.add(const PicsEvent.loadPics());
    return Scaffold(
      appBar: PicAppBar(elevation: 8, title: Strings.appName),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BlocBuilder<PicsBloc, PicsState>(
          bloc: picsBloc,
          builder: (context, state) {
            return state.when(
              initial: () => const PicsGridShimmer(),
              loaded: (pics, isLoadingMore) {
                return PicsGrid(
                  pics: pics,
                  showShimmer: isLoadingMore,
                  picsBloc: picsBloc,
                  onItemTap: (pic) {
                    Navigator.of(context).pushNamed(
                      RouteList.picDetails,
                      arguments: PicDetailScreenArguments(pic),
                    );
                  },
                );
              },
              error: (errorType) => AppErrorWidget(appErrorType: errorType),
            );
          },
        ),
      ),
    );
  }
}
