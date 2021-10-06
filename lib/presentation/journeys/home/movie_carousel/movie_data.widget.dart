import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

class MovieDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use BlocBuilder for MovieBackdropBloc.
    return BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
      builder: (context, state) {
        // Show the text with a movie title. To properly layout the title,
        // you can restrict the number of lines.
        if (state is MovieBackdropChanged) {
          return Text(
            state.movie.title,
            textAlign: TextAlign.center,
            maxLines: 1,
            // Use the overflow property, in case of text, doesn't fit in one line.
            overflow: TextOverflow.fade,
            // Use headline6 font style, that we created in ThemeText. Always use
            // from Theme.of(context), so that when you change theme to dark or any other theme,
            // the app remains consistent.
            style: Theme.of(context).textTheme.headline6,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}