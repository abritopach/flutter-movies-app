import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size.constants.dart';
import 'package:movies_app/presentation/themes/app_color.dart';

import 'package:movies_app/presentation/themes/theme_text.dart';

import '../../common/extensions/size_extensions.dart';

class TabTitleWidget extends StatelessWidget {
  // Tab title.
  final String title;
  // Provide a function holder, that will be invoked when we tap on the tab.
  final Function()? onTap;
  // To maintain the selected state, we’ll also have isSelected field.
  final bool isSelected;
  // We keep false as the default value for isSelected.
  const TabTitleWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  })  :
        assert(title != null, 'title should not be null'),
        assert(onTap != null, 'onTap should not be null'),
        assert(isSelected != null, 'isSelected should not be null'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // GestureDetector to make the Tab tappable, with onTap function passed from the caller.
    return GestureDetector(
      onTap: onTap,
      // Using Container to provide the border for the selected tab. We could have used Column,
      // but that would increase the number of widgets.
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          // We give the bottom border only with a change in color for the selected and unselected state.
          // Give a minimal width as well.
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColor.royalBlue : Colors.transparent,
              width: Sizes.dimen_1.h,
            ),
          ),
        ),
        // Use Text widget to show the tab title.
        child: Text(
          title,
          // Based on isSelected, we also change the text styles.
          style: isSelected
              ? Theme.of(context).textTheme.royalBlueSubtitle1
              : Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }
}