import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:picsum_app/domain/entities/app_error.dart';
import 'package:picsum_app/domain/entities/pic_dm.dart';

part 'pics_state.freezed.dart';

@freezed
class PicsState with _$PicsState {
  const factory PicsState.initial() = Initial;
  const factory PicsState.loaded(List<PicDM> pics,
      {@Default(false) bool isLoadingMore}) = Loaded;
  const factory PicsState.error(AppErrorType error) = Error;
}
