import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size.constants.dart';
import 'package:movies_app/common/screenutil/screenutil.dart';
import 'package:movies_app/presentation/journeys/home/movie_carousel/movie_card.widget.dart';
import '../../../../common/extensions/size_extensions.dart';

class AnimatedMovieCardWidget extends StatelessWidget {
  // 2 extra fields index and pageController, that will be used to calculate the height.
  final int index;
  final PageController pageController;
  final int movieId;
  final String posterPath;

  const AnimatedMovieCardWidget({
    Key? key,
    required this.index,
    required this.movieId,
    required this.posterPath,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wrap the MovieCardWidget with AnimatedBuilder.
    return AnimatedBuilder(
      // In the animation, use the pageController so that when pageController value changes,
      // the AnimatedBuilder will re-draw the child with builder.
      animation: pageController,
      builder: (context, child) {
        // Value starts with 1 and when you scroll, the value changes to 0.9 over frames.
        double value = 1;
        // if statement executes when you scroll. Else executes in the default state.
        if (pageController.position.haveDimensions) {
          value = (pageController.page! - index);
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              // For height, we use value to transform the height of the container.
              height: Curves.easeIn.transform(value) * ScreenUtil.screenHeight * 0.35,
              width: Sizes.dimen_230.w,
              child: child,
            ),
          );
        } else {
          print('else');
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height:
                  Curves.easeIn.transform(index == 0 ? value : value * 0.5) *
                      ScreenUtil.screenHeight * 0.35,
              width: Sizes.dimen_230.w,
              child: child,
            ),
          );
        }
      },
      child: MovieCardWidget(
        movieId: movieId,
        posterPath: posterPath,
      ),
    );
  }
}