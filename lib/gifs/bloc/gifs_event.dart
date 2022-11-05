part of 'gifs_bloc.dart';

abstract class GifsEvent extends Equatable {
  const GifsEvent();

  @override
  List<Object> get props => [];
}


class GetTrendingGifs extends GifsEvent {}

class SearchGifs extends GifsEvent {
  const SearchGifs(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}