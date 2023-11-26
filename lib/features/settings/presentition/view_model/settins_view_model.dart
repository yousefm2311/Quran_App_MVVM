import 'package:get/get.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';

class SettingsViewModel extends GetxController {
  SettingsServices settingsServices = Get.put(SettingsServices());

  RxBool isTrue = true.obs;

  Future<void> setNotificationsEnabled() async {
    isTrue.value = !isTrue.value;
    await settingsServices.sharedPref!
        .setBool('notificationsEnabled', isTrue.value);
    update();
  }
}
