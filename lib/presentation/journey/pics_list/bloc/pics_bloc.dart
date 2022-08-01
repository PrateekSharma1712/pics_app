import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsum_app/common/constants/duration_constants.dart';
import 'package:picsum_app/domain/entities/pic_dm.dart';
import 'package:picsum_app/domain/entities/pic_list_request_params.dart';
import 'package:picsum_app/domain/usecases/get_pics.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_event.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_state.dart';
import 'package:rxdart/rxdart.dart';

class PicsBloc extends Bloc<PicsEvent, PicsState> {
  final GetPics getPics;
  int page = 1;
  bool isFetching = false;
  List<PicDM> pics = List.empty(growable: true);

  PicsBloc(this.getPics) : super(const PicsState.initial()) {
    on<LoadPics>((event, emit) => loadPics(emit));
    on<LoadMorePics>(
      (event, emit) => loadMore(emit),
      transformer: (events, mapper) =>
          events.debounceTime(durationShort).asyncExpand(mapper),
    );
  }

  Future<void> loadPics(emit) async {
    isFetching = true;
    final response = await getPics(PicListRequestParams(page));
    emit(response.fold(
      (l) => PicsState.error(l.appErrorType),
      (pics) {
        this.pics.addAll(pics);
        return PicsState.loaded(this.pics, isLoadingMore: false);
      },
    ));
    isFetching = false;
  }

  Future<void> loadMore(emit) async {
    if (page >= 1 && !isFetching) {
      emit(PicsState.loaded(pics, isLoadingMore: true));
      page++;
      await loadPics(emit);
    }
  }
}
