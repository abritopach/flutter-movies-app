part of 'movie_tab_bloc.dart';

abstract class MovieTabEvent extends Equatable {
  const MovieTabEvent();

  @override
  List<Object> get props => [];
}

// MovieTabChangedEvent extends MovieTabEvent as Bloc's will emit MovieTabEvent
// type of event in mapEventToState.
class MovieTabChangedEvent extends MovieTabEvent {
  // currentTabIndex will store the index of the tab selected. Using an index will make it scalable
  // to add more tabs in the future.
  final int currentTabIndex;

  // A const constructor to keep the current tab at the 0th index.
  const MovieTabChangedEvent({this.currentTabIndex = 0});

  // Use the currentTabIndex in props so that the event doesn't dispatch when the same tab changes.
  @override
  List<Object> get props => [currentTabIndex];
}
