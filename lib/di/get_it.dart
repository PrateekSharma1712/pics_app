import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:picsum_app/data/network/api_client.dart';
import 'package:picsum_app/data/network/datasources/pic_remote_ds.dart';
import 'package:picsum_app/data/repositories/pic_repository_impl.dart';
import 'package:picsum_app/domain/repositories/pic_repository.dart';
import 'package:picsum_app/domain/usecases/get_pics.dart';
import 'package:picsum_app/presentation/journey/pics_list/bloc/pics_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClientImpl(getItInstance()));

  getItInstance.registerLazySingleton<PicRemoteDS>(
      () => PicRemoteDSImpl(getItInstance()));

  getItInstance.registerLazySingleton<PicRepository>(
      () => PicRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetPics>(() => GetPics(getItInstance()));

  getItInstance
      .registerLazySingleton<PicsBloc>(() => PicsBloc(getItInstance()));
}
