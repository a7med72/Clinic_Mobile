import 'package:flutter/material.dart';

import '../Thems/Spacing/spacing_extension.dart';
import '../Thems/Theme/theme_extensions.dart';
import '../Thems/Typography/styles.dart';

class TextFieldCustomer extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Function(String?) validator;
  const TextFieldCustomer({
    super.key,
    this.controller,
    this.labelText,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.hintText,
    this.hintStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    required this.validator,
  });
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: 10.radius),
        labelText: labelText ?? "",
        labelStyle: TextStyles.bodyRegularLarg.copyWith(
          color: context.extraColors.text,
        ),
        isDense: true,
        contentPadding: 12.horizontalPadding + 13.verticalPadding,
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: 10.radius,
              borderSide: BorderSide(color: color.primary, width: 2),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: 10.radius,
              borderSide: BorderSide(color: color.onSurfaceVariant, width: 1),
            ),
        errorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderRadius: 10.radius,
              borderSide: BorderSide(color: color.error, width: 1),
            ),
        focusedErrorBorder:
            focusedErrorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: color.error, width: 2),
            ),
        hintText: hintText ?? "",
        hintStyle:
            hintStyle ??
            TextStyles.bodyRegularLarg.copyWith(
              color: context.extraColors.text,
            ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: context.extraColors.text.withValues(alpha: 0.06),
        filled: true,
      ),
      obscureText: obscureText ?? false,
      style: TextStyles.bodyRegularLarg.copyWith(
        color: context.extraColors.text,
      ),

      validator: (value) {
        return validator(value);
      },
    );
  }
}
