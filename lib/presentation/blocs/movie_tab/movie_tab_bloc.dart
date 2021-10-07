import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_tab_event.dart';
part 'movie_tab_state.dart';

class MovieTabBloc extends Bloc<MovieTabEvent, MovieTabState> {
  MovieTabBloc() : super(MovieTabInitial()) {
    on<MovieTabEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
