import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/languages.constants.dart';
import 'package:movies_app/common/constants/size.constants.dart';
import 'package:movies_app/presentation/journeys/drawer/navigation_expanded_list_item.widget.dart';
import 'package:movies_app/presentation/journeys/drawer/navigation_list_item.widget.dart';
import 'package:movies_app/presentation/widgets/logo.widget.dart';

import '../../../common/extensions/size_extensions.dart';

class NavigationDrawer extends StatelessWidget {
  // Declare a const constructor so that we can use const on the home screen and improve little performance.
  const NavigationDrawer();

  @override
  Widget build(BuildContext context) {
    // Return a Container with a fixed width of 300 and the primaryColor with 0.7 opacity.
    return Container(
      width: Sizes.dimen_300.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
      ),
      // Use SafeArea to have logical space from the top.
      child: SafeArea(
        // For all the items in the vertical direction, use Column.
        child: Column(
          // Use CrossAxisAlignment.start to have every item start from left.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Add Padding from all directions to have proper space between the list items and the Logo.
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_8.h,
                bottom: Sizes.dimen_18.h,
                left: Sizes.dimen_8.w,
                right: Sizes.dimen_8.h,
              ),
              // Use the Logo widget that we create and use in MovieAppBar.
              // If you remember, I intentionally added height as an argument for this Logo. Provide 20 height.
              child: Logo(
                height: Sizes.dimen_20.h,
              ),
            ),
            // Use NavigationListItem for Favorite Movies and keep the onPressed as empty method right now.
            NavigationListItem(
              title: 'Favorite Movies',
              onPressed: () {},
            ),
            NavigationExpandedListItem(
              title: 'Language',
              //1
              children: Languages.languages.map((e) => e.value).toList(),
              onPressed: (index) {},
            ),
            // Similarly add Feedback and About list item as well.
            NavigationListItem(
              title: 'Feedback',
              onPressed: () {},
            ),
            NavigationListItem(
              title: 'About',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}