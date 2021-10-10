class Tab {
  // Store index and name of the tab.
  final int index;
  final String title;
  // Create a const constructor with both fields as required and add normal assertions for safety.
  const Tab({
    required this.index,
    required this.title,
  })  : assert(index >= 0, 'index cannot be negative'),
        assert(title != null, 'title cannot be null');
}