import 'package:flutter/material.dart';
import 'package:movies_app/presentation/journeys/drawer/navigation_list_item.widget.dart';

class NavigationExpandedListItem extends StatelessWidget {
  final String title;
  final List<String> children;
  final Function onPressed;

  const NavigationExpandedListItem({
    Key? key,
    required this.title,
    required this.children,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor,
            blurRadius: 2,
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        // children passed in the NavigationExpandedListItem is a list of string and that used
        // in ExpansionTile accepts List of Widgets. So, using the for loop iterate through the
        // list of strings and create a NavigationListItem.
        children: <Widget>[
          for (int i = 0; i < children.length; i++)
            NavigationSubListItem(
              title: children[i],
              onPressed: () {},
            ),
        ],
      ),
    );
  }
}