import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/Localization/extension_locale.dart';
import '../../../core/Thems/Spacing/spacing_extension.dart';
import '../../../core/Thems/Theme/theme_extensions.dart';
import '../../../core/Thems/Typography/styles.dart';
import '../../../core/Widget/card_customer.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});
  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Column(
      children: [
        SizedBox(height: 30.h),
        Image.asset("assets/image/success.png", fit: BoxFit.fill, height: 170),
        SizedBox(height: 20),
        Text(
          (context.tr("setting_has_been_successfully")),
          style: TextStyles.headingBoldLargText.copyWith(
            color: context.extraColors.text,
          ),
        ),
        SizedBox(height: 5),
        Opacity(
          opacity: 0.7,
          child: Text(
            (context.tr("the_clinic_is_ready_to_use_now")),
            style: TextStyles.headingBoldSmall.copyWith(
              color: context.extraColors.text,
            ),
          ),
        ),
        SizedBox(height: 5),
        Opacity(
          opacity: 0.5,
          child: Text(
            (context.tr("You_can_start_clinic_management_easily")),
            style: TextStyles.headingBoldSmall.copyWith(
              color: context.extraColors.text,
            ),
          ),
        ),
        40.vh,
        Row(
          children: [
            /// add appointment
            CardCustomer(
              padding: 6.paddingAll,
              height: 130.h,
              width: 164.w,
              child: Column(
                children: [
                  19.vh,
                  Container(
                    width: 100.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: context.colors.secondary.withValues(alpha: .09),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.calendar_month,
                      size: 40,
                      color: context.colors.secondary.withValues(alpha: .9),
                    ),
                  ),
                  20.vh,
                  Text(
                    context.tr("create_appointment"),
                    style: isArabic
                        ? TextStyles.headingBoldMedium.copyWith(
                            color: context.extraColors.text,
                          )
                        : TextStyles.headingBoldSmalltext.copyWith(
                            color: context.extraColors.text,
                          ),
                  ),
                ],
              ),
            ),
            5.vw,

            ///Add patient
            CardCustomer(
              width: 164.w,
              height: 130.h,
              padding: 6.paddingAll,
              child: Column(
                children: [
                  19.vh,
                  Container(
                    width: 100.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: context.colors.onPrimaryContainer.withValues(alpha: .09),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: context.colors.onPrimaryContainer.withValues(alpha: .9),
                    ),
                  ),
                  20.vh,
                  Text(
                    context.tr("add_first_patient"),
                    style: isArabic
                        ? TextStyles.headingBoldMedium.copyWith(
                            color: context.extraColors.text,
                          )
                        : TextStyles.headingBoldSmalltext.copyWith(
                            color: context.extraColors.text,
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
