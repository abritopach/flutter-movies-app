import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/movie_tab.constants.dart';
import 'package:movies_app/common/constants/size.constants.dart';
import 'package:movies_app/presentation/blocs/movie_tab/movie_tab_bloc.dart';
import 'package:movies_app/presentation/widgets/movie_list_view_builder.widget.dart';
import 'package:movies_app/presentation/widgets/tab_title.widget.dart';

import 'package:movies_app/common/extensions/size_extensions.dart';

class MovieTabWidget extends StatefulWidget {
  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabWidget> with SingleTickerProviderStateMixin {
  MovieTabBloc get movieTabbedBloc => BlocProvider.of<MovieTabBloc>(context);
  // Declare the current tab index as 0, because by default we’ll show the first tab and movies.
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    // Dispatch the MovieTabChangedEvent to fetch the Popular movies.
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Since the state of tabs & listview changes on tapping any tab, we’ll use BlocBuilder, that will
    // rebuild the child.
    return BlocBuilder<MovieTabBloc, MovieTabState>(
      builder: (context, state) {
        // For some vertical padding top and bottom, we’ll use vertical padding.
        return Padding(
          padding: EdgeInsets.only(top: Sizes.dimen_4.h),
          // As the tabs are above the listview, we use Column.
          child: Column(
            children: <Widget>[
              // All the tabs are in horizontal direction, so we’re using Row.
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Using awesome feature of dart, we can use for loop to build widgets in array.
                  // Run the loop for the number of movies.
                  for (var i = 0; i < MovieTabConstants.movieTabs.length; i++)
                    // Use the TabTitleWidget by using index. Take title from constants, Call a function with
                    // index that will dispatch the MovieTabChangedEvent with respective index.
                    //To decide whether tab is in selected state or not, we compare the index from state with
                    // the index of the tab.
                    TabTitleWidget(
                      title: MovieTabConstants.movieTabs[i].title,
                      onTap: () => _onTabTapped(i),
                      isSelected: MovieTabConstants.movieTabs[i].index == state.currentTabIndex,
                    )
                ],
              ),
              // Below the tabs, we will only build ListView when loading of movies is a success i.e.
              // MovieTabChanged state. So show the listview in Expanded widget so that it takes the available
              // space.
              if (state is MovieTabChanged)
                Expanded(
                  child: MovieListViewBuilder(movies: state.movies),
                ),
            ],
          ),
        );
      },
    );
  }
  // Lastly, you can create a function, that just asks MovieTabbedBloc to dispatch the MovieTabChangedEvent
  // with the index.
  void _onTabTapped(int index) {
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}