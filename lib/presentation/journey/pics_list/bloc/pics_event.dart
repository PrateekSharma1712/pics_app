import 'package:freezed_annotation/freezed_annotation.dart';

part 'pics_event.freezed.dart';

@freezed
class PicsEvent with _$PicsEvent {
  const factory PicsEvent.loadPics() = LoadPics;

  const factory PicsEvent.loadMorePics() = LoadMorePics;
}
