import 'package:picsum_app/data/network/api_constants.dart';
import 'package:picsum_app/data/network/models/pic_rm.dart';
import 'package:picsum_app/domain/entities/pic_dm.dart';

extension RMtoDM on PicRM {
  PicDM toDM() => PicDM(id, author ?? '', url ?? '', width, height,
      "${ApiConstants.baseImageUrl}$id/");
}

extension ListRMtoListDM on List<PicRM> {
  List<PicDM> toDMList() => map((remoteModel) => remoteModel.toDM()).toList();
}
