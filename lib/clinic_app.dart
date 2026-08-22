import 'package:clinic_mobile/core/Localization/app_localization.dart';
import 'package:clinic_mobile/core/Localization/local_cubit.dart';
import 'package:clinic_mobile/core/Routing/app_routre.dart';
import 'package:clinic_mobile/core/Routing/routres.dart';
import 'package:clinic_mobile/core/Thems/Theme/app_theme.dart';
import 'package:clinic_mobile/core/Thems/theme_cubit.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClinicApp extends StatelessWidget {
  final AppRoutre appRoutre;
  const ClinicApp({super.key, required this.appRoutre});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return BlocBuilder<LocaleCubit, Locale>(
          builder: (context, locale) {
            return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,

                // ✅ Themes
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: themeMode,

                // ✅ Localization
                locale: locale,
                supportedLocales: AppLocalization.supportedLocales,
                localizationsDelegates: const [
                  AppLocalization.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  if (deviceLocale == null) return supportedLocales.first;
                  return supportedLocales.firstWhere(
                    (supported) =>
                        supported.languageCode == deviceLocale.languageCode,
                    orElse: () => supportedLocales.first,
                  );
                },

                // ✅ Routing
                initialRoute: Routre.login,
                onGenerateRoute: appRoutre.generateRoute,
              ),
            );
          },
        );
      },
    );
  }
}
