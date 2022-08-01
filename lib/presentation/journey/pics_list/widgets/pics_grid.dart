import 'package:flutter/material.dart';
import 'package:picsum_app/common/constants/duration_constants.dart';
import 'package:picsum_app/domain/entities/pic_dm.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_bloc.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_event.dart';
import 'package:picsum_app/presentation/journey/pics_list/grid_delegates.dart';
import 'package:picsum_app/presentation/journey/pics_list/widgets/pic_mini_image.dart';
import 'package:picsum_app/presentation/journey/pics_list/widgets/pic_mini_shimmer.dart';

class PicsGrid extends StatefulWidget {
  static const int loadingItems = 4;

  final List<PicDM> pics;
  final PicsBloc picsBloc;
  final Function onItemTap;
  final bool showShimmer;

  const PicsGrid({
    required this.pics,
    required this.picsBloc,
    required this.showShimmer,
    required this.onItemTap,
    Key? key,
  }) : super(key: key);

  @override
  State<PicsGrid> createState() => _PicsGridState();
}

class _PicsGridState extends State<PicsGrid> {
  late ScrollController controller;
  late int itemCount;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      if ((controller.offset / controller.position.maxScrollExtent) > 0.8) {
        widget.picsBloc.add(const PicsEvent.loadMorePics());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    itemCount = widget.pics.length;
    if (widget.showShimmer) {
      itemCount += PicsGrid.loadingItems;
    }
    return Stack(
      children: [
        GridView.builder(
          controller: controller,
          gridDelegate: portraitGridDelegate,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: index < 2 ? 8.0 : 0.0),
              child: (index < widget.pics.length)
                  ? PicMiniImage(
                      key: ValueKey('pic_mini_image_$index'),
                      pic: widget.pics[index],
                      imageWidth: screenWidth / gridColumnsInPortrait,
                      onTap: widget.onItemTap,
                    )
                  : (widget.showShimmer)
                      ? const PicMiniShimmer()
                      : const SizedBox.shrink(),
            );
          },
        ),
        Positioned(
          bottom: 32,
          right: 32,
          child: FloatingActionButton(
            onPressed: navigateToTop,
            child: const Icon(Icons.arrow_upward_rounded),
          ),
        ),
      ],
    );
  }

  void navigateToTop() {
    controller.animateTo(0.0, curve: Curves.easeIn, duration: durationMedium);
  }
}
