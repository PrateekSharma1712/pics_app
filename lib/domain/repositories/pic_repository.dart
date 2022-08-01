import 'package:dartz/dartz.dart';
import 'package:picsum_app/domain/entities/app_error.dart';
import 'package:picsum_app/domain/entities/pic_dm.dart';

abstract class PicRepository {
  Future<Either<AppError, List<PicDM>>> fetchPics({int page = 1});
}
