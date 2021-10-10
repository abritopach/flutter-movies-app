import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size.constants.dart';
import 'package:movies_app/domain/entities/movie.entity.dart';
import 'package:movies_app/presentation/widgets/tab_card.widget.dart';

import '../../common/extensions/size_extensions.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListViewBuilder({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // To give some top and bottom spacing in between tabs and the listview, we use Padding widget.
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h),
      // Use ListView.separated to add some space in between each card. Rest all is similar to ListView.Builder.
      child: ListView.separated(
        // Use shrinkWrap to avoid any render flow exceptions.
        shrinkWrap: true,
        // Tell the ListView about the number of movies it has to draw.
        itemCount: movies.length,
        // As this is a horizontal listview, give the scrollDirection as Axis.horizontal.
        scrollDirection: Axis.horizontal,
        // Use separatorBuilder to return a SizedBox of some width, to give margin in between cards.
        separatorBuilder: (context, index) {
          return SizedBox(width: Sizes.dimen_14.w,);
        },
        // Now, build each card by using itemBuilder.
        itemBuilder: (context, index) {
          // Fetch a single movie and return the MovieTabCardWidget.
          final MovieEntity movie = movies[index];
          return TabCardWidget(
            movieId: movie.id,
            title: movie.title,
            posterPath: movie.posterPath,
          );
        },
      ),
    );
  }
}