import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movies_app/presentation/journeys/home/movie_carousel/movie_carousel.widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;
  late MovieBackdropBloc movieBackdropBloc;


  @override
  void initState() {
    super.initState();
    // Initialize the MovieCarouselBloc from GetIt.
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    // Fetch the instance of MovieBackdropBloc from getIt.
    // movieBackdropBloc = getItInstance<MovieBackdropBloc>();

    // Do not take the instance from GetIt, instead take it from MovieCarouselBloc.
    // This same instance will be used in the MovieCarouselBloc to dispatch the
    // MovieBackdropChangedEvent of MovieBackdropBloc.
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;

    // When the home screen initializes, dispatch the only event for MovieCarouselBloc.
    // This will make an API call and yield the MovieCarouselLoaded or MovieCarouselError state.
    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    // In dispose(), don't forget to close the bloc.
    movieCarouselBloc.close();
    movieBackdropBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    // MultiBlocProvider takes an array of BlocProvider.
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => movieCarouselBloc),
        BlocProvider(create: (_) => movieBackdropBloc),
      ],
    // Use BlocProvider to provide the MovieCarouselBloc instance down the tree.
    //return BlocProvider(
      // You need not create the bloc here as it is already done in initState().
    //  create: (_) => movieCarouselBloc,
      // The home screen has 2 sections — top and bottom. To make these sections proportional for any mobile
      // size, we’ll use FractionallySizedBox. The top section is 60% of the screen and the bottom section
      // is 40%
      child: Scaffold(
        // Use BlocBuilder to read the current state of MovieCarouselBloc.
        // The builder takes in context and state.
        body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
          bloc: movieCarouselBloc,
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              return Stack(
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
                    child: MovieCarouselWidget(
                      movies: state.movies,
                      defaultIndex: state.defaultIndex,
                    ),
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
              );
            }
            // When loading of trending movies is an error, we show an empty sized box as of now.
            //Later, in future articles, I’ll show you how to handle UI when error.
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}