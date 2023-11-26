import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/features/onboarding/data/models/onboarding_model.dart';

class OnBoardingViewModel extends GetxController {
  var onboardingController = PageController();
  bool isLast = false;
  int currentIndex = 0;
  changeSmoothIndicator(int index) {
    if (index == onboardingData.length - 1) {
      isLast = true;
      update();
    } else {
      isLast = false;
      update();
    }
  }
}
