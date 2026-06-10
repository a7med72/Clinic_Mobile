import 'package:flutter/material.dart';

import '../Thems/Spacing/spacing_extension.dart';
import '../Thems/Typography/styles.dart';

class ButtonCustomer extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final bool isLoading;
  const ButtonCustomer({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      height: 50.height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color.primary,
          foregroundColor: color.surface,
          shape: RoundedRectangleBorder(borderRadius: 10.radius),
        ),

        onPressed: onPressed,
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Text(text, style: TextStyles.headingBoldMedium),
      ),
    );
  }
}
