import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale locale;
  final Map<String, String> _localizedValues;

  AppLocalization(this.locale, this._localizedValues);

  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();

  static const List<Locale> supportedLocales = [Locale('en'), Locale('ar')];

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static Future<AppLocalization> load(Locale locale) async {
    final jsonString = await rootBundle.loadString(
      'assets/lang/${locale.languageCode}.json',
    );

    final Map<String, dynamic> jsonMap =
        json.decode(jsonString) as Map<String, dynamic>;

    final localizedValues = jsonMap.map(
      (key, value) => MapEntry(key, value.toString()),
    );
    return AppLocalization(locale, localizedValues);
  }

  String translate(String key) {
    return _localizedValues[key] ?? key;
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalization.supportedLocales.any(
      (supported) => supported.languageCode == locale.languageCode,
    );
  }

  @override
  Future<AppLocalization> load(Locale locale) {
    return AppLocalization.load(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
