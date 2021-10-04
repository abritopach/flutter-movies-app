import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/movie.entity.dart';
import 'package:movies_app/presentation/widgets/app_bar.widget.dart';

class MovieCarouselWidget extends StatelessWidget {
  // MovieCarouselWidget is a stateless widget, that works on a list of movies and the defaultIndex.
  final List<MovieEntity> movies;
  final int defaultIndex;

  // Create a constructor with both the fields as required and add the assertion, that we’ve been adding
  // everywhere for defaultIndex.
  const MovieCarouselWidget({
      Key? key,
      required this.movies,
      required this.defaultIndex,
    })  : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0'),
          super(key: key);

  @override
  Widget build(BuildContext context) {
    // A column with just 2 elements. First being the MovieAppBar.
    return Column(
      children: [
        MovieAppBar(),
        // Next in Column is MoviePageView, below MovieAppBar. This widget also takes in the list
        // of movies and the defaultIndex.
        MoviePageView(
          movies: movies,
          initialPage: defaultIndex,
        ),
      ],
    );
  }
}