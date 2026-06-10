import 'package:flutter/material.dart';

class AppExtraColors extends ThemeExtension<AppExtraColors> {
  final Color success;
  final Color warning;
  final Color text;
  final Color borderColor;

  const AppExtraColors({
    required this.success,
    required this.warning,
    required this.text,
    required this.borderColor,
  });

  @override
  AppExtraColors copyWith({
    Color? success,
    Color? warning,
    Color? text,
    Color? borderColor,
  }) {
    return AppExtraColors(
      text: text ?? this.text,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  @override
  AppExtraColors lerp(ThemeExtension<AppExtraColors>? other, double t) {
    if (other is! AppExtraColors) return this;
    return AppExtraColors(
      text: Color.lerp(text, other.text, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
    );
  }
}

extension ThemeGetter on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;

  AppExtraColors get extraColors => Theme.of(this).extension<AppExtraColors>()!;
}
