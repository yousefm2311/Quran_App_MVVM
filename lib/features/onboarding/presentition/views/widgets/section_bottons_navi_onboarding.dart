import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/core/util/color.dart';
import 'package:quran_app_android/core/util/routes/routes.dart';
import 'package:quran_app_android/features/onboarding/presentition/view_model/onboarding_view_model.dart';

class SectionsButtonsNavi extends StatelessWidget {
  const SectionsButtonsNavi({super.key, required this.controller, required this.settingsServices});
  final OnBoardingViewModel controller;
  final SettingsServices settingsServices;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        controller.currentIndex != 0
            ? TextButton(
                onPressed: () {
                  controller.onboardingController.previousPage(
                    duration: const Duration(
                      milliseconds: 750,
                    ),
                    curve: Curves.fastLinearToSlowEaseIn,
                  );
                },
                child: Text(
                  'السابق',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontFamily: 'Rubik',
                        fontSize: 25.0,
                        color: Colors.grey,
                      ),
                ),
              )
            : const SizedBox(),
        const Spacer(),
        TextButton(
          onPressed: () {
            if (controller.isLast) {
              settingsServices.sharedPref!
                  .setBool('onboarding', true)
                  .then((value) {
                Get.offAllNamed(AppRoutes.home);
              });
            } else {
              controller.onboardingController.nextPage(
                duration: const Duration(
                  milliseconds: 750,
                ),
                curve: Curves.fastLinearToSlowEaseIn,
              );
            }
          },
          child: Text(
            'التالي',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'Rubik',
                fontSize: 25.0,
                color: AppColors.kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
