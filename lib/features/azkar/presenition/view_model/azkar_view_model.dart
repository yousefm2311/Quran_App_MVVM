import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/util/app_url.dart';
import 'package:quran_app_android/features/azkar/data/models/azkar_model.dart';
class AzkarViewModel extends GetxController {
  AzkarViewModel() {
    readJson();
  }
  List<dynamic> items = [];
  List<AzkarModel> azkarModel = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString(AppUrl.adhkarUrl);
    final data = await json.decode(response);
    items = data;
    update();
    for (int i = 0; i < items.length; i++) {
      azkarModel.add(AzkarModel.fromJson(items[i]));
    }
    update();
  }

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
}
