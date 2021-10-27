// Create a class AppLocalizations.
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/common/constants/languages.constants.dart';

class AppLocalizations {
  // We will load translations bases on Locale so add a Locale final field.
  final Locale locale;

  AppLocalizations(this.locale);

  // In AppLocalizations, add a delegate field that contains an instance of _AppLocalizationDelegate.
  static const LocalizationsDelegate<AppLocalizations> delegate =
    _AppLocalizationDelegate();

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    final jsonString = await rootBundle
        .loadString('assets/languages/${locale.languageCode}.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));

    return true;
  }
}

  // Declare a delegate that extends LocalizationsDelegate of type AppLocalizations.
  class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  // Give it a const constructor.
  const _AppLocalizationDelegate();

  // This is basically for safety checks that the locale that we are loading is supported by the application.
  // So, you’ll check whether the locale selected is in the list of your locales.
  @override
  bool isSupported(Locale locale) {
    return Languages.languages
    .map((e) => e.code)
    .toList()
    .contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // Here, you’ll create an instance of AppLocalization with the selected locale.
    AppLocalizations localizations = AppLocalizations(locale);
    // Then, you’ll load the JSON that you have created based on the language code. The load() will be created in just a moment.
    await localizations.load();
    // After successfully loading the JSON map, you’ll return the localization.
    return localizations;
  }

  // Override the 3 methods and return false from shouldReload(). We'll work on other methods in a moment.
  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
    false;
}