part of 'movie_tab_bloc.dart';

abstract class MovieTabState extends Equatable {

  // Create the currentTabIndex field, as we did in the MovieTabChangedEvent event.
  final int currentTabIndex;

  // Add it to the constructor as well.
  const MovieTabState({required this.currentTabIndex});

  // Again in props, add this field. By doing this, if you tap on the same tab,
  // the bloc will not emit the state.
  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabInitial extends MovieTabState {
  const MovieTabInitial({required int currentTabIndex})
    : super(currentTabIndex: currentTabIndex);
}

// When you change the tab, you’ll emit MovieTabChanged state.
class MovieTabChanged extends MovieTabState {
  // Declare a list of movies variable to store the movies.
  final List<MovieEntity> movies;

  // A const constructor with currentTabIndex and movies. We're using currentTabIndex from the abstract
  // class, so you need not use this here.
  const MovieTabChanged({required int currentTabIndex, required this.movies})
      // User super to assign the child class currentTabIndex to the abstract class currentTabIndex.
      : super(currentTabIndex: currentTabIndex);

  // Use props and assign both the currentTabIndex and movies.
  @override
  List<Object> get props => [currentTabIndex, movies];
}

// When there is an error in fetching the movies, you’ll emit MovieTabLoadError state.
class MovieTabLoadError extends MovieTabState {
  // A const constructor with currentTabIndex only.
  const MovieTabLoadError({required int currentTabIndex})
      // Also, assign the currentTabIndex to the super class.
      : super(currentTabIndex: currentTabIndex);
}