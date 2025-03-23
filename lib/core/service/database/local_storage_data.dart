import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/features/quran/data/models/details_model.dart';

class LocalStorageData extends GetxController {
  SettingsServices settings = Get.find<SettingsServices>();

  Future<VersesModel?> get getUser async {
    try {
      VersesModel? ayahModel = await _getUserData();
      return ayahModel; // إرجاع القيمة حتى لو كانت null
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null; // إرجاع null في حالة حدوث خطأ
  }

  setUser(VersesModel ayahModel) async {
    if (settings.sharedPref != null) {
      await settings.sharedPref!.setString(
        'bookMark',
        json.encode(ayahModel.toJson()),
      );
    }
  }

  Future<VersesModel?> _getUserData() async {
    if (settings.sharedPref != null) {
      var value = settings.sharedPref!.getString('bookMark');
      if (value != null) {
        return VersesModel.fromJson(json.decode(value));
      }
    }
    return null; // إرجاع null إذا كانت البيانات غير موجودة
  }

  void deleteUser() async {
    if (settings.sharedPref != null) {
      await settings.sharedPref!.clear();
    }
  }
}
