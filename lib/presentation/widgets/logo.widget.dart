import 'package:flutter/material.dart';

import '../../common/extensions/size_extensions.dart';

class Logo extends StatelessWidget {
  // Logo is a stateless widget with a dynamic height that will be provided by the calling widget.
  // This is important here because the same Logo widget will be used in the NavigationDrawer, when
  // we implement that.
  final double height;
  // Constructor with height as required field and add some assertions, that make this widget fail-safe.
  // With these two assertions, this widget unknowingly can’t be called with height as null or <= 0.
  const Logo({
    Key? key,
    required this.height,
  })  : assert(height != null, 'height must not be null'),
        assert(height > 0, 'height should be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //3
    return Image.asset(
      'assets/pngs/logo.png',
      color: Colors.white,
      height: height.h,
    );
  }
}