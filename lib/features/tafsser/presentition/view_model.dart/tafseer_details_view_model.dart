// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:convert';
// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/database/local_storage_data.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/core/util/app_url.dart';
import 'package:quran_app_android/core/util/constant/constant.dart';
import 'package:quran_app_android/features/quran/data/models/details_model.dart';
import 'package:quran_app_android/features/quran/data/models/quran_audio_model.dart';
import 'package:quran_app_android/features/tafsser/data/models/tafaseerModel.dart';

class TafseerDetailsViewModel extends GetxController {
  RxBool isLoading = false.obs;
  TafseerDetailsViewModel() {
    getCurrentMark();
    readJsonTafseer();
  }

  SettingsServices settingsServices = Get.put(SettingsServices());
  List<dynamic> itemsTafseer = [];
  List<TafaseerModel> tafaseerModel = [];
  Future<void> readJsonTafseer() async {
    try {
      isLoading.value = true;
      final String response = await rootBundle.loadString(AppUrl.tafseerUrl);
      final data = await json.decode(response);
      itemsTafseer = data;
      for (int i = 0; i < itemsTafseer.length; i++) {
        tafaseerModel.add(TafaseerModel.fromJson(itemsTafseer[i]));
      }
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
      update();
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  RxBool isPlay = false.obs;
  RxBool isLoadingg = false.obs;
  // final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  QuranAudioModel? quranAudioModel;

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(":");
  }

  int? currentIndex3;
  int? currentIndex4;

  void changeIndex3(index) {
    settingsServices.sharedPref!.setInt(changeIndex_3, index);
    currentIndex3 = settingsServices.sharedPref!.getInt(changeIndex_3);
    update();
  }

  void changeIndex4(index) {
    settingsServices.sharedPref!.setInt(changeIndex_4, index);
    currentIndex4 = settingsServices.sharedPref!.getInt(changeIndex_4);
    update();
  }

  final LocalStorageData localStorageData = Get.put(LocalStorageData());
  void setUser(user) async {
    await localStorageData.setUser(user);
    update();
  }

  void addBookMark(id, text, translation) {
    VersesModel versesModel = VersesModel(
      id: id,
      text: text,
      translation: translation,
    );
    settingsServices.sharedPref!
        .setDouble(scrollPostition, scrollController.position.pixels);
    settingsServices.sharedPref!.setBool(bookMark, true);
    setUser(versesModel);
    update();
  }

  VersesModel? get ayahMod => _ayahModel;
  VersesModel? _ayahModel;
  void getCurrentMark() async {
    await localStorageData.getUser.then(( value) {
      _ayahModel = value;
      update();
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
    update();
  }

  final buckGlobal = PageStorageBucket();
  ScrollController scrollController = ScrollController(
    keepScrollOffset: true,
  );
  void scrollToLastPosition() {
    double lastPosition =
        settingsServices.sharedPref!.getDouble(scrollPostition) ?? 0.0;
    if (scrollController.hasClients) {
      scrollController.jumpTo(
        lastPosition,
      );
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

  @override
  void dispose() {
    // audioPlayer.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
