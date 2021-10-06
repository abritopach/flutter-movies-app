import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size.constants.dart';
import 'package:movies_app/presentation/themes/app_color.dart';

import '../../common/extensions/size_extensions.dart';

class Separator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // A simple container with width and height. We could’ve used Divider, but the divider doesn't
    // have a radius and uses indents to decide the width.
    return Container(
      height: Sizes.dimen_1.h,
      width: Sizes.dimen_80.w,
      // Padding from top and bottom for separation.
      padding: EdgeInsets.only(
        top: Sizes.dimen_2.h,
        bottom: Sizes.dimen_6.h,
      ),
      // To make round edges, use BoxDecoration with BorderRadius.
      // Give a simple gradient to the separator.
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_1.h)),
        gradient: LinearGradient(
          colors: [
            AppColor.violet,
            AppColor.royalBlue,
          ],
        ),
      ),
    );
  }
}