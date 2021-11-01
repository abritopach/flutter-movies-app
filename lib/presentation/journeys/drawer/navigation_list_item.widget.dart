import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size.constants.dart';

import '../../../common/extensions/size_extensions.dart';

class NavigationListItem extends StatelessWidget {
  // Fields for title and a function onPressed, that will be called when you press the line item.
  final String title;
  final Function onPressed;

  const NavigationListItem({
    Key? key,
    required this.title,
    required this.onPressed
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use GestureDetector to have this title tappable.
    return GestureDetector(
      onTap: onPressed(),
      // We will use Container because we need to add a similar blurry effect to each line item.
      child: Container(
        // Add BoxShadow in BoxDecoration with blurRadius of 2 and primary color.
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              blurRadius: 2,
            ),
          ],
        ),
        // Use the ListTile from the flutter framework.
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}

class NavigationSubListItem extends StatelessWidget {
  final String title;
  final Function onPressed;

  const NavigationSubListItem({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed(),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              blurRadius: 2,
            ),
          ],
        ),
        child: ListTile(
          //1
          contentPadding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
