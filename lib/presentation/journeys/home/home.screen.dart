import 'package:flutter/material.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;

  @override
  void initState() {
    super.initState();
    // Initialize the MovieCarouselBloc from GetIt.
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    // When the home screen initializes, dispatch the only event for MovieCarouselBloc.
    // This will make an API call and yield the MovieCarouselLoaded or MovieCarouselError state.
    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    // In dispose(), don't forget to close the bloc.
    movieCarouselBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    // The home screen has 2 sections — top and bottom. To make these sections proportional for any mobile
    // size, we’ll use FractionallySizedBox. The top section is 60% of the screen and the bottom section
    // is 40%
    return Scaffold(
      body: Stack(
        // When you use FractionallySizedBox, you should use StackFit.expand, because this allows the stack
        // to take the available space.
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            // The top part should have topCenter as its alignment.
            alignment: Alignment.topCenter,
            // The top section is 60% of the screen, hence it should be aligned top with 60% of the height
            // of the available space, which in this case is a complete screen. Once, we add the
            // MovieCarouselWidget, it will go in this part, replacing the Placeholder.
            heightFactor: 0.6,
            // TODO: Add MovieCarouselWidget here in child.
            child: Placeholder(color: Colors.grey),
          ),
          FractionallySizedBox(
            // The bottom FractionallySizedBox obviously will have bottomCenter as its alignment.
            alignment: Alignment.bottomCenter,
            // The heightFactor of this remaining part of the screen which will be 0.4
            heightFactor: 0.4,
            // MovieTabbedWidget will replace the Placeholder widget
            // TODO: Add MovieTabbedWidget here in child.
            child: Placeholder(color: Colors.white),
          ),
        ],
      ),
    );
  }
}