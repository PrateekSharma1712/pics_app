import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AuthorSection extends StatelessWidget {
  final String author;

  const AuthorSection({
    Key? key,
    required this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: const BorderRadius.horizontal(
          right: Radius.circular(8),
        ),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.white30,
        child: Text(
          "BY: $author",
          style: Theme.of(context).textTheme.headline4?.copyWith(
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
        ),
      ),
    );
  }
}
