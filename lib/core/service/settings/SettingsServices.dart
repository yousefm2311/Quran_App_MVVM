// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/service/network/adhan_dio_helper.dart';
import 'package:quran_app/core/service/network/dio_helper.dart';
import 'package:quran_app/core/service/settings/notifications_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  WidgetsFlutterBinding.ensureInitialized();
  NotifyHelper().initializeNotification();
  Workmanager().executeTask((taskName, inputData) {
    NotifyHelper().displayNotification();
    return Future.value(true);
  });
}

class SettingsServices extends GetxService {
  SharedPreferences? sharedPref;

  Future<SettingsServices> init() async {
    sharedPref = await SharedPreferences.getInstance();
    Dio_Helper.init();
    Adhan_Dio_Helper.init();
    Workmanager().initialize(callbackDispatcher);
    NotifyHelper().initializeNotification();
    NotifyHelper().scheduleAzkar();
    sharedPref!.setBool('enable', true);
    sharedPref!.setBool('stop_noti', true);
    return this;
  }
}
