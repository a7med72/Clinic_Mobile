import 'package:clinic_mobile/core/Helpers/Storage/SharedPreference/shared_pref_helper.dart';
import 'package:flutter/cupertino.dart';

class LocaleService {
  static const _key = 'local';

  /// Get initial locale from shared preference or device locale
  Future<Locale> getInitialLocale() async {
    final save = await SharedPrefHelper.getData<String>(_key);

    if (save != null) {
      return Locale(save);
    }
    final deviceLang =
        WidgetsBinding.instance.platformDispatcher.locale.languageCode;

    return Locale(deviceLang);
  }

  /// Save locale to shared preference
  Future<void> saveLocale(Locale locale) async {
    await SharedPrefHelper.setData(_key, locale.languageCode);
  }
}
