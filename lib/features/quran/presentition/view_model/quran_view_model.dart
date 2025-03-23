import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/util/app_url.dart';
import 'package:quran_app_android/features/quran/data/models/model.dart';

class QuranViewModel extends GetxController {
  QuranViewModel() {
    readJson();
  }

  List<dynamic> items = [];
  List<NameModel> nameModel = [];
  TextEditingController searchController = TextEditingController();
  Future<void> readJson() async {
    final String response = await rootBundle.loadString(AppUrl.nameQuranUrl);
    final data = await json.decode(response);
    items = data;
    update();
    for (int i = 0; i < items.length; i++) {
      nameModel.add(NameModel.fromJson(items[i]));
    }
    update();
  }

  // List<NameModel> searchResult = [];
  // onSearchTextChange(String text) async {
  //   searchResult.clear();
  //   if (text.isEmpty) {
  //     update();
  //     return;
  //   }
  //   for (var element in nameModel) {
  //     if (element.name!.contains(text.capitalizeFirst!) ||
  //         element.transliteration!.contains(text.capitalizeFirst!)) {
  //       searchResult.add(element);
  //       update();
  //     }
  //   }
  // }
}
