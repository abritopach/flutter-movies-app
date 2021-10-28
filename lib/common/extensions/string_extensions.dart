import 'package:flutter/material.dart';
import 'package:movies_app/presentation/movie.app.localizations.dart';

extension StringExtension on String {
  // Declare a function that you can call on any string.
  String intelliTrim() {
    // Check if the length of string is more than 15. If it is more than 15, than you can take the first 15
    // letters. Otherwise, take the complete string. This way, we only trim the strings which are more than
    // allowed length.
    return this.length > 15 ? '${this.substring(0, 15)}...' : this;
  }

  String t(BuildContext context) {
    return AppLocalizations.of(context)?.translate(this) ?? '';
  }
}
