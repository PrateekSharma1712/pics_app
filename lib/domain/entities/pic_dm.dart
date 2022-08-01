import 'package:freezed_annotation/freezed_annotation.dart';

part 'pic_dm.freezed.dart';

@freezed
class PicDM with _$PicDM {
  factory PicDM(String id, String author, String url, int width, int height,
      String imageUrl) = _PicDM;
}
