import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FullScreenShimmer extends StatelessWidget {
  const FullScreenShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Shimmer.fromColors(
      baseColor: primaryColor.withOpacity(0.5),
      highlightColor: primaryColor.withOpacity(0.3),
      child: const DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
        ),
      ),
    );
  }
}
