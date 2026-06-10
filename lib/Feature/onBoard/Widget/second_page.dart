import 'package:clinic_mobile/core/Localization/extension_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/Thems/Theme/theme_extensions.dart';
import '../../../core/Thems/Typography/styles.dart';
import '../../../core/Widget/text_field_customer.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            (context.tr("Clinic_Information")),
            style: TextStyles.headingBoldMedium.copyWith(
              color: context.extraColors.text,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            (context.tr(
              "Please_fill_in_your_clinic_basic_information_to_get_started",
            )),
            style: TextStyles.bodyRegularMedium.copyWith(
              color: context.extraColors.text.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 35.h),
          FieldOnboard(
            validator: (context.tr("this_field_is_required")),
            label: (context.tr("clinic_name")),
            icon: const Icon(Icons.local_hospital),
          ),
          SizedBox(height: 10.h),
          FieldOnboard(
            validator: (context.tr("this_field_is_required")),
            label: (context.tr("Specialization")),
            icon: Icon(Icons.heart_broken),
          ),
          SizedBox(height: 10.h),
          FieldOnboard(
            validator: (context.tr("this_field_is_required")),
            label: (context.tr("phone_number")),
            icon: const Icon(Icons.phone),
          ),
        ],
      ),
    );
  }
}

class FieldOnboard extends StatelessWidget {
  final String validator;
  final String label;
  final Icon icon;
  const FieldOnboard({
    super.key,
    required this.validator,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldCustomer(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validator;
        }
        return null;
      },
      // hintText: label,
      labelText: label,
      suffixIcon: Icon(
        icon.icon,
        color: context.extraColors.text.withOpacity(0.7),
        size: 20,
      ),
    );
  }
}
