// ignore_for_file: unnecessary_null_comparison, await_only_futures, unnecessary_string_interpolations

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';
import 'package:quran_app/features/quran/data/models/details_model.dart';

class LocalStorageData extends GetxController {
  SettingsServices settings = Get.put(SettingsServices());

  Future<VersesModel?> get getUser async {
    try {
      VersesModel ayahModel = await _getUserData();
      if (ayahModel == null) {
        return null;
      }
      return ayahModel;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }

  setUser(ayahModel) async {
    await settings.sharedPref!
        .setString('bookMark', json.encode(ayahModel.toJson()));
  }

  _getUserData() async {
    var value = await settings.sharedPref!.getString('bookMark');
    return VersesModel.fromJson(json.decode(value!));
  }

  void deleteUser() async {
    await settings.sharedPref!.clear();
  }
}
