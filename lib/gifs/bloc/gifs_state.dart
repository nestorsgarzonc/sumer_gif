part of 'gifs_bloc.dart';

class GifsState extends Equatable {
  const GifsState({required this.gifs});

  factory GifsState.initial() => GifsState(gifs: StateAsync.initial());

  final StateAsync<List<GifModel>> gifs;

  bool get isEmpty => gifs.data?.isEmpty ?? true;

  @override
  List<Object> get props => [gifs];

  GifsState copyWith({
    StateAsync<List<GifModel>>? gifs,
  }) {
    return GifsState(gifs: gifs ?? this.gifs);
  }
}
