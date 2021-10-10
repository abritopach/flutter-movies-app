import 'package:movies_app/data/models/tab.model.dart';

class MovieTabConstants {
  // Create a list of tabs and add 3 tabs with the index.
  static const List<Tab> movieTabs = const [
    const Tab(index: 0, title: 'Popular'),
    const Tab(index: 1, title: 'Now'),
    const Tab(index: 2, title: 'Soon'),
  ];
}