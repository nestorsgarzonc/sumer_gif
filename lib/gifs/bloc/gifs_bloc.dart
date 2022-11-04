import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gifs_event.dart';
part 'gifs_state.dart';

class GifsBloc extends Bloc<GifsEvent, GifsState> {
  GifsBloc() : super(GifsInitial()) {
    on<GifsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
