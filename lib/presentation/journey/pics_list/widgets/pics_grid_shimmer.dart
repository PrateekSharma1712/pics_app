import 'package:flutter/material.dart';
import 'package:picsum_app/presentation/journey/pics_list/grid_delegates.dart';
import 'package:picsum_app/presentation/journey/pics_list/widgets/pic_mini_shimmer.dart';

class PicsGridShimmer extends StatelessWidget {
  const PicsGridShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GridView.builder(
        itemCount: 8,
        gridDelegate: portraitGridDelegate,
        itemBuilder: (_, __) => const PicMiniShimmer(),
      ),
    );
  }
}
