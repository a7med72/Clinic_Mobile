import 'package:clinic_mobile/core/Thems/Colors/app_colors.dart';
import 'package:clinic_mobile/core/Thems/Colors/color_scheme.dart';
import 'package:flutter/material.dart';
import 'theme_extensions.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    colorScheme: AppColorScheme.light,
    scaffoldBackgroundColor: AppColorScheme.light.surface,

    extensions: [
      AppExtraColors(
        success: AppColors.successLight,
        warning: AppColors.warningLight,
        text: AppColors.onBackgroundTextLight,
        borderColor: AppColors.outlineLight,
      ),
    ],
  );

  static ThemeData dark = ThemeData(
    colorScheme: AppColorScheme.dark,
    scaffoldBackgroundColor: AppColorScheme.dark.surface,

    extensions: [
      AppExtraColors(
        success: AppColors.successDark,
        warning: AppColors.warningDark,
        text: AppColors.ponbackgroundTextDark,
        borderColor: AppColors.outlineDark,
      ),
    ],
  );
}
