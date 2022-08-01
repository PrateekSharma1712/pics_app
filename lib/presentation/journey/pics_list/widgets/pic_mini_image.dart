import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:picsum_app/common/constants/duration_constants.dart';
import 'package:picsum_app/domain/entities/pic_dm.dart';

class PicMiniImage extends StatelessWidget {
  final PicDM pic;
  final double imageWidth;
  final Function onTap;

  const PicMiniImage({
    Key? key,
    required this.pic,
    required this.imageWidth,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: ValueKey('pic_mini_image_inkwell_key_${pic.id}'),
      onTap: () => onTap(pic),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: '${pic.imageUrl}${imageWidth.toInt()}',
              fit: BoxFit.cover,
              width: imageWidth,
              height: imageWidth,
              fadeOutDuration: durationMedium,
              fadeInDuration: durationMedium,
              placeholderFadeInDuration: durationMedium,
            ),
            if (pic.author.isNotEmpty)
              _Overlay(
                key: const ValueKey('author_name_key'),
                text: pic.author,
              )
          ],
        ),
      ),
    );
  }
}

class _Overlay extends StatelessWidget {
  final String text;

  const _Overlay({Key? key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          height: 60.0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.04),
                ],
                stops: const [0, 0.8, 0.9],
              ),
            ),
          ),
        ),
        Positioned(
          left: 8,
          right: 8,
          bottom: 8,
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
