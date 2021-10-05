import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/movie.entity.dart';

part 'movie_backdrop_event.dart';
part 'movie_backdrop_state.dart';

class MovieBackdropBloc extends Bloc<MovieBackdropEvent, MovieBackdropState> {
  MovieBackdropBloc() : super(MovieBackdropInitial()) {
    on<MovieBackdropEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

@override
Stream<MovieBackdropState> mapEventToState(MovieBackdropEvent event) async* {
  // This is straight-forward, we’re just yielding the state with the movie received from the event.
  yield MovieBackdropChanged((event as MovieBackdropChangedEvent).movie);
}
