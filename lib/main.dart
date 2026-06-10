import 'package:clinic_mobile/clinic_app.dart';
import 'package:clinic_mobile/core/Localization/local_cubit.dart';
import 'package:clinic_mobile/core/Localization/locale_service.dart';
import 'package:clinic_mobile/core/Routing/app_routre.dart';
import 'package:clinic_mobile/core/Thems/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localeService = LocaleService();
  final initialLocale = await localeService.getInitialLocale();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<LocaleCubit>(
          create: (context) => LocaleCubit(localeService, initialLocale),
        ),
      ],
      child: ClinicApp(appRoutre: AppRoutre()),
    ),
  );
}
