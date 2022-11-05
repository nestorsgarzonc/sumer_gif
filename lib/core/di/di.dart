import 'package:get_it/get_it.dart';
import 'package:sumer_gif/core/external/api_handler.dart';
import 'package:sumer_gif/gifs/bloc/gifs_bloc.dart';
import 'package:sumer_gif/gifs/data_sources/gifs_data_source.dart';
import 'package:sumer_gif/gifs/repositories/gifs_repository.dart';

class DI {
  static final di = GetIt.instance;

  static void setup() {
    di.registerFactory<GifsBloc>(() => GifsBloc(di()));
    di.registerLazySingleton<GifsRepository>(() => GifsRepositoryImpl(di()));
    di.registerLazySingleton<GifsDataSource>(() => GifsDataSourceImpl(di()));
    di.registerLazySingleton<ApiHandler>(() => const ApiHandlerImpl());
  }
}
