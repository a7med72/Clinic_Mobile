import 'package:clinic_mobile/core/Localization/extension_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/Thems/Spacing/spacing_extension.dart';
import '../../../core/Thems/Theme/theme_extensions.dart';
import '../../../core/Thems/Typography/styles.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            (context.tr("Hello_in_ClinicEasy")),
            style: TextStyles.headingBoldMedium.copyWith(
              color: context.extraColors.text,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            (context.tr(
              "we_help_you_manage_your_clinic_easily_and_efficiently",
            )),
            style: TextStyles.bodyRegularMedium.copyWith(
              color: context.extraColors.text.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 35.h),
          Container(
            width: 300.w,

            decoration: BoxDecoration(borderRadius: 10.radius),
            child: Image.asset(
              "assets/image/onboard.png",
              fit: BoxFit.fill,
              height: 300.h,
            ),
          ),
          SizedBox(height: 30.h),
          Structions(
            text: (context.tr("Managment_of_appointments_and_patient_easily")),
          ),
          SizedBox(height: 15.h),
          Structions(
            text: (context.tr("Organize_Medical_Description_Reports")),
          ),
          SizedBox(height: 15.h),
          Structions(
            text: (context.tr("Monitor_Clinic_Activity_in_Real_Time")),
          ),
        ],
      ),
    );
  }
}

class Structions extends StatelessWidget {
  final String text;
  const Structions({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 5.paddingOnly(right: 15, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 15.w,
            height: 15.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colors.primary,
            ),
            child: const Icon(Icons.check, size: 15, color: Colors.white),
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: Text(
              text,
              style: TextStyles.bodyRegularLarg.copyWith(
                color: context.extraColors.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
