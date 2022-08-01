import 'package:freezed_annotation/freezed_annotation.dart';

part 'pic_rm.freezed.dart';
part 'pic_rm.g.dart';

@Freezed(toJson: false)
class PicRM with _$PicRM {
  factory PicRM(
    String id,
    String? author,
    String? url,
    int width,
    int height,
  ) = _PicRM;

  factory PicRM.fromJson(Map<String, dynamic> json) => _$PicRMFromJson(json);
}
