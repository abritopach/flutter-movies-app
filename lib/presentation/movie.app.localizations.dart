// Create a class AppLocalizations.
import 'package:flutter/material.dart';

class AppLocalizations {
  // We will load translations bases on Locale so add a Locale final field.
  final Locale locale;

  AppLocalizations(this.locale);

  // In AppLocalizations, add a delegate field that contains an instance of _AppLocalizationDelegate.
  static const LocalizationsDelegate<AppLocalizations> delegate =
    _AppLocalizationDelegate();
  }
  // Declare a delegate that extends LocalizationsDelegate of type AppLocalizations.
  class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  // Give it a const constructor.
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    throw UnimplementedError();
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    throw UnimplementedError();
  }

  // Override the 3 methods and return false from shouldReload(). We'll work on other methods in a moment.
  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
    false;
}