import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:picsum_app/data/network/datasources/pic_remote_ds.dart';
import 'package:picsum_app/domain/entities/app_error.dart';
import 'package:picsum_app/domain/entities/pic_dm.dart';
import 'package:picsum_app/domain/repositories/pic_repository.dart';
import 'package:picsum_app/mappers/pic_mapper.dart';

class PicRepositoryImpl extends PicRepository {
  final PicRemoteDS picRemoteDS;

  PicRepositoryImpl(this.picRemoteDS);

  @override
  Future<Either<AppError, List<PicDM>>> fetchPics({int page = 1}) async {
    try {
      final picsRM = await picRemoteDS.fetchPics(page: page);
      return Right(picsRM.toDMList());
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
