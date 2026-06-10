import 'package:clinic_mobile/core/Localization/locale_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleCubit extends Cubit<Locale> {
  final LocaleService _service;

  LocaleCubit(this._service, Locale initialLocale) : super(initialLocale);

  Future<void> changeLocale(Locale locale) async {
    await _service.saveLocale(locale);
    emit(locale);
  }

  Future<void> toggleLocale() async {
    final newLocale = state.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');
    await changeLocale(newLocale);
  }
}
