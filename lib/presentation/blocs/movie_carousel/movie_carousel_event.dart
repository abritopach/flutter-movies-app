part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselEvent extends Equatable {
  const MovieCarouselEvent();

  @override
  List<Object> get props => [];
}

class CarouselLoadEvent extends MovieCarouselEvent {

  // Will give us the flexibility to decide which movie will be in the center of our carousel at the start.
  final int defaultIndex;

  // A const constructor with defaultIndex as 0, if not passed.
  const CarouselLoadEvent({this.defaultIndex = 0}):
    assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  // props is used for comparison between 2 objects of the same type.
  List<Object> get props => [defaultIndex];
}
