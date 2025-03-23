// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/features/quran/data/models/details_model.dart';
import 'package:quran_app_android/core/service/database/local_storage_data.dart';
import 'package:quran_app_android/core/util/app_url.dart';

class QuranScreenViewModel extends GetxController {
  QuranScreenViewModel() {
    getCurrentMarkQuran();
    readJson();
  }

  RxBool isLoading = false.obs;
  List<dynamic> items = [];
  List<AyahModel> ayah_Model = [];
  RxBool isOnline = false.obs;
  late StreamSubscription subscription;
  final Connectivity connectivity = Connectivity();

  Future<void> readJson() async {
    try {
      isLoading.value = true;
      final String response = await rootBundle.loadString(AppUrl.quranUrl);
      final data = await json.decode(response);
      items = data;
      for (int i = 0; i < items.length; i++) {
        ayah_Model.add(AyahModel.fromJson(items[i]));
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

  SettingsServices sharedPref = Get.find<SettingsServices>();
  bool currentSave = false;
  int? currentIndex3Quran;
  int? currentIndex4Quran;

  void changeIndex3Quran(index) {
    if (sharedPref.sharedPref != null) {
      sharedPref.sharedPref!.setInt("currentIndex3Quran", index);
      currentIndex3Quran = sharedPref.sharedPref!.getInt("currentIndex3Quran");
      update();
    }
  }

  void changeIndex4Quran(index) {
    if (sharedPref.sharedPref != null) {
      sharedPref.sharedPref!.setInt("currentIndex4Quran", index);
      currentIndex4Quran = sharedPref.sharedPref!.getInt("currentIndex4Quran");
      update();
    }
  }

  final LocalStorageData localStorageData = Get.find<LocalStorageData>();
  void setDataQuran(user) async {
    await localStorageData.setUser(user);
    update();
  }

  void addBookMarkQuran(id, text, translation) {
    if (sharedPref.sharedPref != null && scrollController.hasClients) {
      VersesModel versesModel = VersesModel(
        id: id,
        text: text,
        translation: translation,
      );
      sharedPref.sharedPref!.setDouble(
        'scroll',
        scrollController.position.pixels,
      );
      sharedPref.sharedPref!.setBool('bookQuran', true);
      setDataQuran(versesModel);
      debugPrint('Goood ');
      debugPrint(versesModel.id.toString());
      update();
    }
  }


VersesModel? get ayahModell => ayahModel;
  VersesModel? ayahModel;
 void getCurrentMarkQuran() async {
    await localStorageData.getUser
        .then((value) {
          ayahModel = value; // يمكن أن تكون value null
          update();
        })
        .catchError((error) {
          debugPrint(error.toString());
        });
    update();
  }

  final buckGlobal = PageStorageBucket();
  ScrollController scrollController = ScrollController(keepScrollOffset: true);

  void scrollToLastPosition() {
    if (sharedPref.sharedPref != null && scrollController.hasClients) {
      double lastPosition = sharedPref.sharedPref!.getDouble('scroll') ?? 0.0;
      scrollController.jumpTo(lastPosition);
      update();
    }
  }

  double fontSize = 18;
  void increaseFont() {
    fontSize++;
    update();
  }

  void decreaseFont() {
    fontSize--;
    update();
  }

  String replaceFarsiNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['۰', '۱', '۲', '۳', '٤', '۵', '٦', '۷', '۸', '۹'];
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], arabic[i]);
    }
    return input;
  }
}
