import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';

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
  Future<void> checkNotificationPermissions() async {
    var notificationStatus = await Permission.notification.status;
    if (notificationStatus.isDenied) {
      if (await Permission.notification.request().isGranted) {
        debugPrint('Notification permission granted');
      } else {
        debugPrint('Notification permission denied');
      }
    } else if (notificationStatus.isPermanentlyDenied) {
      debugPrint('Notification permission permanently denied');
    } else {
      debugPrint('Notification permission granted');
    }
  }
}
