import 'package:flutter/material.dart';

class PicAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Color? backgroundColor;
  final double? elevation;

  PicAppBar({
    Key? key,
    this.title = "",
    this.leading,
    this.backgroundColor,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      title: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.headline5?.copyWith(
              color: Colors.white,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w500,
            ),
      ),
      centerTitle: true,
      leading: leading,
      backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
