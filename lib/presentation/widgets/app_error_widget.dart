import 'package:flutter/material.dart';
import 'package:picsum_app/common/constants/string_constants.dart';
import 'package:picsum_app/domain/entities/app_error.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType appErrorType;

  const AppErrorWidget({
    Key? key,
    required this.appErrorType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          appErrorType == AppErrorType.network
              ? Strings.noNetwork
              : Strings.apiError,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Theme.of(context).primaryColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
