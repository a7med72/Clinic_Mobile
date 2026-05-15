import 'package:clinic_mobile/core/Thems/Colors/app_colors.dart';
import 'package:clinic_mobile/core/Thems/Colors/color_scheme.dart';
import 'package:flutter/material.dart';
import 'theme_extensions.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    colorScheme: AppColorScheme.light,
    scaffoldBackgroundColor: AppColorScheme.light.background,

    extensions:  [
      AppExtraColors(success: AppColors.successLight, warning: AppColors.warningLight),
    ],
  );

  static ThemeData dark = ThemeData(
    colorScheme: AppColorScheme.dark,
    scaffoldBackgroundColor: AppColorScheme.dark.background,

    extensions:  [
      AppExtraColors(success: AppColors.successDark, warning: AppColors.warningDark),
    ],
  );
}
