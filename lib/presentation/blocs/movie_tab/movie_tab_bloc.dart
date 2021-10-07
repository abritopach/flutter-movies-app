import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/data/core/app.error.dart';
import 'package:movies_app/domain/entities/movie.entity.dart';
import 'package:movies_app/domain/usecases/get_coming_soon.usecase.dart';
import 'package:movies_app/domain/usecases/get_playing_now.usecase.dart';
import 'package:movies_app/domain/usecases/get_popular.usecase.dart';
import 'package:movies_app/utils/noparams.dart';

part 'movie_tab_event.dart';
part 'movie_tab_state.dart';

class MovieTabBloc extends Bloc<MovieTabEvent, MovieTabState> {

  // Declare the remaining 3 usecases, GetPopular, GetPlayingNow and GetComingSoon and use them
  // in the constructor.
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  MovieTabBloc({
    required this.getPopular,
    required this.getPlayingNow,
    required this.getComingSoon,
  }) : super(MovieTabInitial(currentTabIndex: 0)) {
    on<MovieTabEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  @override
  Stream<MovieTabState> mapEventToState(
    MovieTabEvent event,
  ) async* {
    // We are only working on MovieTabChangedEvent, so have only one if.
    // This will also auto-cast the event to MovieTabChangedEvent type.
    if (event is MovieTabChangedEvent) {
      // Use Either similar to that in MovieCarouselBloc, because the usecases return the same type.
      late Either<AppError, List<MovieEntity>> moviesEither;
      // Use switch for currentTabIndex to call separate usecases based on the current tab.
      switch (event.currentTabIndex) {
        // Our 1st tab is Populars, so use the GetPopular usecase.
        case 0:
          moviesEither = await getPopular(NoParams());
          break;
        // The 2nd tab is Now, so use the GetPlayingNow usecase.
        case 1:
          moviesEither = await getPlayingNow(NoParams());
          break;
        // The 3rd tab is soon, so use the GetComingSoon usecase.
        case 2:
          moviesEither = await getComingSoon(NoParams());
          break;
      }
      // Again use the fold operator.
      yield moviesEither.fold(
        // When there is an error, emit the MovieTabLoadError.
        (l) => MovieTabLoadError(currentTabIndex: event.currentTabIndex),
        // Where there is a success, emit the MovieTabChanged, with the current tab and respective movies.
        (movies) {
          return MovieTabChanged(
            currentTabIndex: event.currentTabIndex,
            movies: movies,
          );
        },
      );
    }
  }
}
