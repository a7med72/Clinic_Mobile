import 'package:clinic_mobile/core/Helpers/Storage/SharedPreference/shared_pref_helper.dart';
import 'package:clinic_mobile/core/Localization/app_localization.dart';
import 'package:flutter/cupertino.dart';

class LocaleService {
  static const _key = 'locale';

  /// Get initial locale from shared preference or device locale.
  /// Falls back to the first supported locale when the device locale is unsupported.
  Future<Locale> getInitialLocale() async {
    final savedLanguageCode = await SharedPrefHelper.getData<String>(_key);

    if (savedLanguageCode != null &&
        AppLocalization.supportedLocales.any(
          (locale) => locale.languageCode == savedLanguageCode,
        )) {
      return Locale(savedLanguageCode);
    }

    final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
    final supportedLocale = AppLocalization.supportedLocales.firstWhere(
      (locale) => locale.languageCode == deviceLocale.languageCode,
      orElse: () => AppLocalization.supportedLocales.first,
    );

    return supportedLocale;
  }

  /// Save locale to shared preference
  Future<void> saveLocale(Locale locale) async {
    await SharedPrefHelper.setData(_key, locale.languageCode);
  }
}
