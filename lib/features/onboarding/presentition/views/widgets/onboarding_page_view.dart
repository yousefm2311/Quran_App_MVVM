import 'package:flutter/material.dart';
import 'package:quran_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:quran_app/features/onboarding/presentition/view_model/onboarding_view_model.dart';
import 'package:quran_app/features/onboarding/presentition/views/widgets/onboarding_page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.controller});
  final OnBoardingViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: controller.onboardingController,
        onPageChanged: (value) {
          controller.changeSmoothIndicator(value);
          controller.currentIndex = value;
        },
        itemBuilder: (context, index) =>
            OnBoardingPageViewItems(index: index, model: onboardingData[index]),
        itemCount: onboardingData.length,
      ),
    );
  }
}
