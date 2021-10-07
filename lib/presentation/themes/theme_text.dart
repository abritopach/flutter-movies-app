import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/common/constants/size.constants.dart';
import 'package:movies_app/presentation/themes/app_color.dart';

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

  // Create a subtitle1 as per the material guidelines I have shown in the last article.
  // For unselected tabs, we have a white color.
  static TextStyle? get whiteSubtitle1 => _poppinsTextTheme.subtitle1?.copyWith(
    fontSize: Sizes.dimen_16.sp,
    color: Colors.white,
  );

  // For each movie card, we have a title with 14 size and white color. Also, according to material
  // guidelines, I am also adding letterSpacing, wordSpacing and height.
  static TextStyle? get whiteBodyText2 => _poppinsTextTheme.bodyText2?.copyWith(
    color: Colors.white,
    fontSize: Sizes.dimen_14.sp,
    wordSpacing: 0.25,
    letterSpacing: 0.25,
    height: 1.5,
  );

  static getTextTheme() => TextTheme(
    headline6: _whiteHeadline6,
    subtitle1: whiteSubtitle1,
    bodyText2: whiteBodyText2,
  );

}

// Create extension on TextTheme.
extension ThemeTextExtension on TextTheme {
  // Create a TextStyle copying subtitle1 with the royalBlue color and fontWeight.
  TextStyle? get royalBlueSubtitle1 => subtitle1?.copyWith(
        color: AppColor.royalBlue,
        fontWeight: FontWeight.w600,
      );
}
