import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/movie.entity.dart';
import 'package:movies_app/domain/usecases/get_trending.usecase.dart';
import 'package:movies_app/utils/noparams.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {

  final GetTrending getTrending;

  MovieCarouselBloc({
    required this.getTrending,
  }) : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(
    MovieCarouselEvent event,
  ) async* {
    // Handle if the event dispatched is CarouselLoadEvent.
    if (event is CarouselLoadEvent) {
      // Call the getTrending usecase with NoParams()
      final moviesEither = await getTrending(NoParams());
      yield moviesEither.fold(
        (l) => MovieCarouselError(),
        // When success(right), yield success state with movies and default index.
        (movies) {
          return MovieCarouselLoaded(
            movies: movies,
            defaultIndex: event.defaultIndex,
          );
        },
      );
    }
  }
}
