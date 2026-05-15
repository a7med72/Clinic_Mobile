import 'package:flutter/material.dart';

class AppExtraColors extends ThemeExtension<AppExtraColors> {
  final Color success;
  final Color warning;

  const AppExtraColors({required this.success, required this.warning});

  @override
  AppExtraColors copyWith({Color? success, Color? warning}) {
    return AppExtraColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
    );
  }

  @override
  AppExtraColors lerp(ThemeExtension<AppExtraColors>? other, double t) {
    if (other is! AppExtraColors) return this;
    return AppExtraColors(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
    );
  }
}
