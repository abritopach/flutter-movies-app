import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/common/constants/size.constants.dart';

import '../../common/extensions/size_extensions.dart';

class ThemeText {
  const ThemeText._();

  // Using Poppins Font.
  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  // We add .sp so that the text sizes are also according to the screen width.
  static TextStyle? get _whiteHeadline6 => _poppinsTextTheme.headline6?.copyWith(
        fontSize: Sizes.dimen_20.sp,
        color: Colors.white,
      );

  static getTextTheme() => TextTheme(
        headline6: _whiteHeadline6,
      );
}