import 'package:dartz/dartz.dart';
import 'package:picsum_app/domain/entities/app_error.dart';
import 'package:picsum_app/domain/entities/pic_dm.dart';
import 'package:picsum_app/domain/entities/pic_list_request_params.dart';
import 'package:picsum_app/domain/repositories/pic_repository.dart';
import 'package:picsum_app/domain/usecases/usecase.dart';

class GetPics extends Usecase<List<PicDM>, PicListRequestParams> {
  final PicRepository picRepository;

  GetPics(this.picRepository);

  @override
  Future<Either<AppError, List<PicDM>>> call(PicListRequestParams params) =>
      picRepository.fetchPics(page: params.page);
}
