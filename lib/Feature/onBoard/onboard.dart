import 'package:clinic_mobile/Feature/onBoard/Widget/first_page.dart';
import 'package:clinic_mobile/Feature/onBoard/Widget/fourth_page.dart';
import 'package:clinic_mobile/Feature/onBoard/Widget/steps_progress_bar.dart';
import 'package:clinic_mobile/Feature/onBoard/Widget/second_page.dart';
import 'package:clinic_mobile/Feature/onBoard/Widget/third_page.dart';
import 'package:clinic_mobile/core/Localization/extension_locale.dart';
import 'package:flutter/material.dart';

import '../../core/Routing/extension_router.dart';
import '../../core/Thems/Spacing/spacing_extension.dart';
import '../../core/Widget/button_customer.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  PageController pageController = PageController();
  final List<Widget> pages = [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
    FourthPage(),
  ];

  int currentPage = 0;
  int get totalPages => pages.length;
  double get progress => (currentPage + 1) / totalPages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: 8.allPadding,
          child: Column(
            children: [
              // LinearProgressIndicator(value: progress,),
              Padding(
                padding: 10.paddingOnly(top: 2, right: 10, left: 10),
                child: StepProgressBar(
                  currentStep: currentPage,
                  totalSteps: totalPages,
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  children: pages,
                ),
              ),
              // Spacer(),
              ButtonCustomer(
                onPressed: () {
                  if (currentPage == totalPages - 1) {
                    context.pushNamed('home');
                  } else {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                text: currentPage == totalPages - 1
                    ? (context.tr("go_to_dashboard"))
                    : (context.tr("Next")),
                isLoading: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
