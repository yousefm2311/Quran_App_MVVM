// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/network/adhan_dio_helper.dart';
import 'package:quran_app_android/core/service/network/dio_helper.dart';
import 'package:quran_app_android/core/service/settings/notifications_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  WidgetsFlutterBinding.ensureInitialized();
  NotifyHelper().initializeNotification();
}

// void backgroundFetchHeadlessTask(HeadlessTask task, dynamic staticVars) async {
//   final randomIndex = DateTime.now().second % staticVars.smallDo3a2.length;
//   final currentZekr = staticVars.smallDo3a2[randomIndex];
//   await HomeWidget.saveWidgetData('currentZekr', currentZekr);
//   await HomeWidget.updateWidget(
//     iOSName: 'MyHomeWidget',
//     androidName: 'MyHomeWidget',
//   );
//   BackgroundFetch.finish(task.taskId);
// }

class SettingsServices extends GetxService {
  SharedPreferences? sharedPref;
  Future<SettingsServices> init() async {
    sharedPref = await SharedPreferences.getInstance();
    Dio_Helper.init();
    Adhan_Dio_Helper.init();
    // Workmanager().initialize(callbackDispatcher);
    NotifyHelper().initializeNotification();
    NotifyHelper().scheduleAzkar();
    sharedPref!.setBool('enable', true);
    sharedPref!.setBool('stop_noti', true);

    // BackgroundFetch.configure(
    //   BackgroundFetchConfig(
    //     minimumFetchInterval: 15, // كل 15 دقيقة (أقل قيمة مسموحة)
    //     stopOnTerminate: false,
    //     enableHeadless: true,
    //   ),
    //   backgroundFetchHeadlessTask,
    // );
    return this;
  }
}
