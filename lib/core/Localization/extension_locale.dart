import 'package:clinic_mobile/core/Localization/app_localization.dart';
import 'package:flutter/widgets.dart';

extension ExtensionLocale on BuildContext {
  /// Simple translation helper using the localized AppLocalization instance.
  String tr(String key) {
    final localization = AppLocalization.of(this);
    return localization?.translate(key) ?? key;
  }
}
