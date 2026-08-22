import 'package:clinic_mobile/core/Thems/Theme/theme_extensions.dart';
import 'package:clinic_mobile/core/Widget/card_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/Localization/extension_locale.dart';
import '../../../../core/Thems/Spacing/spacing_extension.dart';
import '../../../../core/Thems/Typography/styles.dart';
import '../../../../core/Widget/text_field_customer.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 70.h),
            Image.asset("assets/image/icon.png", height: 150.h),
            10.vh,
            Text(
              (context.tr("ClinicEasy")),
              style: TextStyles.headingBoldLarg.copyWith(
                color: context.colors.primary,
              ),
            ),
            20.vh,
            CardCustomer(
              padding: 10.allPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr("Login"),
                    style: TextStyles.headingBoldMedium.copyWith(
                      color: context.extraColors.text,
                    ),
                  ),
                  10.vh,
                  TextFieldCustomer(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.tr("this_field_is_required");
                      }
                      return null;
                    },
                    hintText: context.tr("Name & Email"),
                    labelText: context.tr("Name & Email"),
                  ),
                  15.vh,
                  TextFieldCustomer(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return context.tr("this_field_is_required");
                      }
                      return null;
                    },
                    hintText: context.tr("Password & phone"),
                    labelText: context.tr("Password & Phone"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
