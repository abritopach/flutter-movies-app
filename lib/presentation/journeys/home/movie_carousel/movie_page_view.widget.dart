// Create a stateful widget with a list of movies and initialPage. The initialPage is same as defaultIndex,
// so apply the same assertion to this as well.
import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size.constants.dart';
import 'package:movies_app/common/screenutil/screenutil.dart';
import 'package:movies_app/domain/entities/movie.entity.dart';
import 'package:movies_app/presentation/journeys/home/movie_carousel/movie_card.widget.dart';
import '../../../../common/extensions/size_extensions.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const MoviePageView({
    Key? key,
    required this.movies,
    required this.initialPage,
  })  : assert(initialPage >= 0, 'initialPage cannot be less than 0'),
        super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  // In the State class of MoviePageView, declare a PageController.
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // In initState(), instantiate _pageController with viewportFraction as 0.7.
    // viewportFraction decides how much screen share each item of PageView will take.
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    //4
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Wrap the PageView.Builder with Container, so that we can give height and margin to it.
    return Container(
      // To maintain some space between MovieAppBar and the other details of the movie, we need the
      // vertical margin.
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      // Once we add the animation to the MovieCardWidget, we’ll need the height. So, after some calculation,
      // 35% of the screen height is the perfect value here. Don’t hardcode any heights in this case,
      // using ratios is best. As we used 0.6 for FractionallySizedBox in HomeScreen, 0.35 here makes total sense.
      height: ScreenUtil.screenHeight * 0.35,
      // Use PageView.Builder. Builder is efficient when you don't know about how many children will be drawn.
      // To manipulate how much part is visible on the screen, we use _pageController.
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          // In the itemBuilder, based on index return the MovieCardWidget. Generally, we get 20 movies from
          // the API, so itemBuilder will create 20 cards.
          final MovieEntity movie = widget.movies[index];
          return MovieCardWidget(
            movieId: movie.id,
            posterPath: movie.posterPath,
          );
        },
        // When you’re in between of a complete scroll transaction, pageSnapping true makes it complete the
        // scroll action.
        pageSnapping: true,
        // You should mention the itemCount because itemBuilder will be called only with indices greater than
        // or equal to zero and less than itemCount.
        itemCount: widget.movies.length,
        // To update the backdrop image and title of the movie below PageView, we'll need to get the callback
        // when the PageView is scrolled.
        onPageChanged: (index) {},
      ),
    );
  }
}