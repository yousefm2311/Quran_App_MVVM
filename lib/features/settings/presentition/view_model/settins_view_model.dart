import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';

class SettingsViewModel extends GetxController {
  SettingsServices settingsServices = Get.put(SettingsServices());

  TimeOfDay? timeOfDay;

  void toggleSwitch(value) {
    settingsServices.sharedPref!.setBool('enable', value);
    update();
  }

  void toggleSwitchStopNoti(value) {
    settingsServices.sharedPref!.setBool('stop_noti', value);
    update();
  }
}
