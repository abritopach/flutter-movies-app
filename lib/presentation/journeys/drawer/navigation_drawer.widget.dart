import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size.constants.dart';

import '../../../common/extensions/size_extensions.dart';

class NavigationDrawer extends StatelessWidget {
  // Declare a const constructor so that we can use const on the home screen and improve little performance.
  const NavigationDrawer();

  @override
  Widget build(BuildContext context) {
    // Return a Container with a fixed width of 300 and the primaryColor with 0.7 opacity.
    return Container(
      width: Sizes.dimen_300.w,
      color: Theme.of(context).primaryColor.withOpacity(0.7),
    );
  }
}