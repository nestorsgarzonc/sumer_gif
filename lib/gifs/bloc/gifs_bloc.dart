import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:sumer_gif/core/wrappers/state_wrapper.dart';
import 'package:sumer_gif/gifs/models/gif_model.dart';
import 'package:sumer_gif/gifs/repositories/gifs_repository.dart';

part 'gifs_event.dart';
part 'gifs_state.dart';

class GifsBloc extends Bloc<GifsEvent, GifsState> {
  GifsBloc(this.gifsRepository) : super(GifsState.initial()) {
    on<GetTrendingGifs>(getTrendingGifs);
    on<SearchGifs>(searchGifs, transformer: restartable());
  }

  final GifsRepository gifsRepository;

  Future<void> getTrendingGifs(GetTrendingGifs event, Emitter emit) async {
    emit(state.copyWith(gifs: StateAsync.loading()));
    final gifs = await gifsRepository.getTrendingGifs();
    gifs.fold(
      (l) => emit(state.copyWith(gifs: StateAsync.error(l))),
      (r) => emit(state.copyWith(gifs: StateAsync.success(r))),
    );
  }

  Future<void> searchGifs(SearchGifs event, Emitter emit) async {
    if (event.query.isEmpty) {
      add(GetTrendingGifs());
      return;
    }
    emit(state.copyWith(gifs: StateAsync.loading()));
    final gifs = await gifsRepository.searchGifs(event.query);
    gifs.fold(
      (l) => emit(state.copyWith(gifs: StateAsync.error(l))),
      (r) => emit(state.copyWith(gifs: StateAsync.success(r))),
    );
  }
}
