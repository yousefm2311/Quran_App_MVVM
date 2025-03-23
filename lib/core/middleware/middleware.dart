
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/core/util/routes/routes.dart';

class AuthMiddleWare extends GetMiddleware {
  SettingsServices settingsServices = Get.put(SettingsServices());

  @override
  RouteSettings? redirect(String? route) {
    if (settingsServices.sharedPref!.getBool('onboarding') == true) {
      return RouteSettings(name: AppRoutes.home);
    }
    return null;
  }
}