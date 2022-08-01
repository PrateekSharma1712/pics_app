import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:picsum_app/common/constants/duration_constants.dart';
import 'package:picsum_app/domain/entities/pic_dm.dart';
import 'package:picsum_app/presentation/journey/pic_details/widgets/author_section.dart';
import 'package:picsum_app/presentation/journey/pic_details/widgets/full_screen_shimmer.dart';
import 'package:picsum_app/presentation/widgets/pic_app_bar.dart';

class PicDetailScreenArguments {
  final PicDM pic;

  PicDetailScreenArguments(this.pic);
}

class PicDetailsScreen extends StatelessWidget {
  final PicDetailScreenArguments arguments;

  const PicDetailsScreen({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pic = arguments.pic;
    final size = MediaQuery.of(context).size;
    final imageUrl = '${pic.imageUrl}'
        '${size.width.toInt()}/${size.height.toInt()}';
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fitWidth,
            width: size.width,
            placeholder: (_, __) => const FullScreenShimmer(),
            fadeOutDuration: durationMedium,
            fadeInDuration: durationMedium,
            placeholderFadeInDuration: durationMedium,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PicAppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: Navigator.of(context).pop,
              ),
            ),
          ),
          if (pic.author.isNotEmpty)
            Positioned(
              bottom: 60,
              left: 0,
              right: 32,
              child: AuthorSection(author: pic.author),
            ),
        ],
      ),
    );
  }
}
