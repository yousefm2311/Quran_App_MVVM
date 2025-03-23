// ignore_for_file: unnecessary_null_comparison, await_only_futures, unnecessary_string_interpolations

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/features/adhan/data/models/adhan_model.dart';

class LocalStorageAdhanData extends GetxController {
  SettingsServices settings = Get.put(SettingsServices());

  Future<AdhanModel?> get getUser async {
    try {
      AdhanModel userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }

  setData(AdhanModel adhanModel) async {
    await settings.sharedPref!
        .setString('adhanData', json.encode(adhanModel.toJson()));
  }

  _getUserData() async {
    var value = await settings.sharedPref!.getString('adhanData');
    return AdhanModel.fromJson(json.decode(value!));
  }

  void deleteUser() async {
    await settings.sharedPref!.clear();
  }
}
