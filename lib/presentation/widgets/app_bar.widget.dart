import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/common/constants/size.constants.dart';
import 'package:movies_app/common/screenutil/screenutil.dart';
import 'package:movies_app/presentation/widgets/logo.widget.dart';
import '../../common/extensions/size_extensions.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Because we’re creating our own app bar, it is necessary to have padding from left, right, and top.
    // Notice, we’re considering the notch height in padding-top to make it work for phones with the notch
    // at the top. It is useless to mention the use of .w when considering the horizontal spacing and
    // .h when considering the vertical spacing.
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
        left: Sizes.dimen_16.w,
        right: Sizes.dimen_16.w,
      ),
      // Use Row to lay out the elements in horizontal.
      child: Row(
        children: <Widget>[
          // In Row, at start and end add the 2 IconButtons. One being SvgPicture and the other being taken
          // from the Flutter framework itself.
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset('assets/svgs/menu.svg', height: Sizes.dimen_12.h),
          ),
          // The remaining space in between these 2 images, use the Logo widget.
          Expanded(
            child: const Logo(height: Sizes.dimen_14),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white, size: Sizes.dimen_12.h),
          ),
        ],
      ),
    );
  }
}