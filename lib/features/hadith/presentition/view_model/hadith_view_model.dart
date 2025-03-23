import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/core/util/app_url.dart';
import 'package:quran_app_android/core/util/widgets/custom_toast.dart';
import 'package:quran_app_android/features/hadith/data/models/hadith_model.dart';
import 'package:quran_app_android/features/hadith/data/models/hadith_model_malek.dart';

class HadithViewModel extends GetxController {
  HadithViewModel() {
    hadithRead();
  }

  SettingsServices c = Get.put(SettingsServices());
  List<dynamic> items = [];
  List<HadithModel> hadithList = [];
  RxBool isLoading = false.obs;



  double fontSize = 20;
  void increaseFont() {
    fontSize++;
    update();
  }

  void decreaseFont() {
    fontSize--;
    update();
  }

  int currentIndex = 0;
  void changeIndex(index) {
    currentIndex = index;
    update();
  }

  PageController pageController = PageController();
  void addCurrentIndex(index) {
    c.sharedPref!.setInt('saveIndex', index);
    update();
  }

  void goToPage() {
    if (c.sharedPref!.getInt('saveIndex') != null) {
      if (pageController.hasClients) {
        pageController.animateToPage(
          c.sharedPref!.getInt('saveIndex')!.toInt(),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        update();
      }
    } else {
      defaultToast(text: 'لا يوجد شئ محفوظ');
    }
  }

  List<dynamic> itemsData = [];
  List<HadithModelFinal> hadithModelFinal = [];
  RxBool isLoadingg = false.obs;
  Future<void> hadithRead() async {
    try {
      isLoadingg.value = true;
      final String response =
          await rootBundle.loadString(AppUrl.hadithUrl);
      final data = await json.decode(response);

      itemsData = data;
      update();
      for (int i = 0; i < itemsData.length; i++) {
        hadithModelFinal.add(HadithModelFinal.fromJson(itemsData[i]));
      }
      isLoadingg.value = false;
      update();
    } catch (e) {
      isLoadingg.value = false;
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
