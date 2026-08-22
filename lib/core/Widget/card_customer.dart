import 'package:flutter/material.dart';

import '../Thems/Spacing/spacing_extension.dart';
import '../Thems/Theme/theme_extensions.dart';

class CardCustomer extends StatelessWidget {
  final BoxBorder? border;
  final double? width;
  final Widget? child;
  final double? height;
  final EdgeInsetsGeometry? padding;
  const CardCustomer({
    super.key,
    this.border,
    this.child,
    this.padding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? 4.allPadding,
      child: Container(
        padding: padding ?? 13.allPadding,
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: context.extraColors.borderColor.withValues(alpha: .9),
              blurRadius: 4,
              offset: const Offset(1, 1),
            ),
          ],

          border: border,

          borderRadius: 10.radius,
          color: context.colors.onSurface,
        ),
        child: child,
      ),
    );
  }
}
