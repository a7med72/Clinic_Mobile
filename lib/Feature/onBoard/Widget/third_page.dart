import 'package:clinic_mobile/core/Localization/extension_locale.dart';
import 'package:clinic_mobile/core/Thems/Spacing/spacing_extension.dart';
import 'package:clinic_mobile/core/Thems/Theme/theme_extensions.dart';
import 'package:clinic_mobile/core/Thems/Typography/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/Widget/card_customer.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            (context.tr("Select_role")),
            style: TextStyles.headingBoldMedium.copyWith(
              color: context.extraColors.text,
            ),
          ),
          Text(
            (context.tr("Please_select_the_role_that_suits_your_work")),
            style: TextStyles.bodyRegularMedium.copyWith(
              color: context.extraColors.text.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 35.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedindex = index;
                  });
                },
                child: CardOnboard(isSelected: selectedindex == index),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CardOnboard extends StatelessWidget {
  const CardOnboard({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return CardCustomer(
      border: !isSelected
          ? null
          : Border.all(
              width: 1.5.w,
              color: context.colors.primary.withOpacity(1),
            ),
      child: Row(
        children: [
          !isSelected
              ? Icon(Icons.circle_outlined)
              : Icon(Icons.check_circle, color: context.colors.primary),
          SizedBox(width: 15.w),
          Column(
            children: [
              Text(
                "Admin",
                style: TextStyles.bodyRegularLarg.copyWith(
                  color: context.extraColors.text,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "Doctor",
                style: TextStyles.bodyRegularMedium.copyWith(
                  color: context.extraColors.text.withOpacity(0.6),
                ),
              ),
            ],
          ),
          Spacer(),

          CircleAvatar(
            radius: 20.r,
            child: Image.asset(
              "assets/image/onboard.png",
              fit: BoxFit.fill,
              height: 100.h,
            ),
          ),
        ],
      ),
    );
  }
}
