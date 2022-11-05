import 'package:dartz/dartz.dart';
import 'package:sumer_gif/core/failure/failure.dart';
import 'package:sumer_gif/gifs/data_sources/gifs_data_source.dart';
import 'package:sumer_gif/gifs/models/gif_model.dart';

abstract class GifsRepository {
  Future<Either<Failure, List<GifModel>>> getTrendingGifs();
  Future<Either<Failure, List<GifModel>>> searchGifs(String query);
}

class GifsRepositoryImpl implements GifsRepository {
  final GifsDataSource gifsDatasouce;

  GifsRepositoryImpl(this.gifsDatasouce);

  @override
  Future<Either<Failure, List<GifModel>>> getTrendingGifs() async {
    try {
      final gifs = await gifsDatasouce.getTrendingGifs();
      return Right(gifs);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GifModel>>> searchGifs(String query) async {
    try {
      final gifs = await gifsDatasouce.searchGifs(query);
      return Right(gifs);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
