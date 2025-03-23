// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/core/util/color.dart';
import 'package:quran_app_android/features/onboarding/data/models/onboarding_model.dart';
import 'package:quran_app_android/features/onboarding/presentition/view_model/onboarding_view_model.dart';
import 'package:quran_app_android/features/onboarding/presentition/views/widgets/onboarding_page_view.dart';
import 'package:quran_app_android/features/onboarding/presentition/views/widgets/section_bottons_navi_onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoardingScreen extends GetWidget<OnBoardingViewModel> {
  OnBoardingScreen({super.key});
  OnBoardingViewModel onBoardingViewModel = Get.put(OnBoardingViewModel());
  SettingsServices settingsServices = Get.put(SettingsServices());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: GetBuilder<OnBoardingViewModel>(builder: (control) {
            return Column(
              children: [
                OnBoardingPageView(controller: controller),
                const SizedBox(height: 30.0),
                SmoothPageIndicator(
                  controller: controller.onboardingController,
                  count: onboardingData.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: AppColors.kPrimaryColor,
                    dotHeight: 4,
                    dotWidth: 10,
                    dotColor: Colors.grey,
                  ),
                ),
                const SizedBox(height: 20.0),
                SectionsButtonsNavi(
                    controller: controller, settingsServices: settingsServices),
                const SizedBox(height: 30.0),
              ],
            );
          }),
        ),
      ),
    );
  }
}
