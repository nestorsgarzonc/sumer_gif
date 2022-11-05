import 'package:sumer_gif/core/constants/api_constants.dart';
import 'package:sumer_gif/core/external/api_handler.dart';
import 'package:sumer_gif/core/logger/logger.dart';
import 'package:sumer_gif/gifs/models/gif_model.dart';

abstract class GifsDataSource {
  Future<List<GifModel>> getTrendingGifs();
  Future<List<GifModel>> searchGifs(String query);
}

class GifsDataSourceImpl implements GifsDataSource {
  final ApiHandler apiHandler;

  GifsDataSourceImpl(this.apiHandler);

  @override
  Future<List<GifModel>> getTrendingGifs() async {
    try {
      const url = '/trending?api_key=${ApiConstants.apiKey}';
      final response = await apiHandler.get(url);
      final gifs =
          (response.responseMap?['data'] as List).map((e) => GifModel.fromMap(e)).toList();
      return gifs;
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }

  @override
  Future<List<GifModel>> searchGifs(String query) async {
    try {
      final url = '/search?api_key=${ApiConstants.apiKey}&q=$query';
      final response = await apiHandler.get(url);
      final gifs =
          (response.responseMap?['data'] as List).map((e) => GifModel.fromMap(e)).toList();
      return gifs;
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }
}
