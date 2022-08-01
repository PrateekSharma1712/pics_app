import 'package:bloc_test/bloc_test.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_bloc.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_event.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_state.dart';

class PicsBlocMock extends MockBloc<PicsEvent, PicsState> implements PicsBloc {}
