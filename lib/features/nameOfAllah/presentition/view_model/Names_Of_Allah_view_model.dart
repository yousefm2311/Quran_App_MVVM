// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/util/app_url.dart';
import 'package:quran_app/features/nameOfAllah/data/models/Names_Of_Allah_model.dart';

class NamesOfAllahViewModel extends GetxController {
  NamesOfAllahViewModel() {
    readJson();
  }
  List<dynamic> items = [];
  List<NamesOfAllahModel> nameOfAllah = [];
  RxBool isLoading = false.obs;

  Future<void> readJson() async {
    try {
      isLoading.value = true;
      final String response =
          await rootBundle.loadString(AppUrl.nameOfAllahUrl);
      final data = await json.decode(response);
      items = data;
      update();
      for (int i = 0; i < items.length; i++) {
        nameOfAllah.add(NamesOfAllahModel.fromJson(items[i]));
      }
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
