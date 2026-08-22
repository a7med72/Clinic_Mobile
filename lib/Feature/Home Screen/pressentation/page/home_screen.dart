import 'package:flutter/material.dart';

import '../../../../core/Thems/Theme/theme_extensions.dart';
import '../../../../core/Thems/Typography/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Home Screen",
          style: TextStyles.headingBoldLarg.copyWith(
            color: context.extraColors.text,
          ),
        ),
      ),
    );
  }
}
