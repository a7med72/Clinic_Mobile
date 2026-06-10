import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppColorScheme {
  static const light = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primaryLight,
    onPrimary: AppColors.primarycontainerLight,
    secondary:AppColors.secondaryLight,
    onSecondary: AppColors.secondaryContainerLight,
    error: AppColors.errorLight,
    onError: AppColors.warningLight,
    surface: AppColors.surfaceLight,
    onSurface: AppColors.surfaceContainerLowInputsLight,
  );

  static const dark = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryDark,
    onPrimary: AppColors.primarycontainerDark,
    secondary: AppColors.secondaryDark,
    onSecondary: AppColors.secondaryContainerDark,
    error: AppColors.errorDark,
    onError: AppColors.warningDark,
    surface: AppColors.surfaceDark,
    onSurface: AppColors.surfaceContainerLowDark,
  );
}
