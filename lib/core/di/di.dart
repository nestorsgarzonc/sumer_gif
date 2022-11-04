import 'package:get_it/get_it.dart';
import 'package:sumer_gif/core/external/api_handler.dart';

class DI {
  final getIt = GetIt.instance;

  void setup() {
    getIt.registerLazySingleton<ApiHandler>(() => const ApiHandlerImpl());
  }
}
