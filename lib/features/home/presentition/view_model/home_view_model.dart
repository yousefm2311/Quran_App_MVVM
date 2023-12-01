import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';
import 'package:quran_app/core/util/assets.dart';
import 'package:quran_app/core/util/routes/routes.dart';

class HomeViewModel extends GetxController {
  HomeViewModel() {
    requestLocationPermission();
    requestNotificationPermission();
    getLastRead();
  }
  Future<void> requestLocationPermission() async {
    try {
      final PermissionStatus statusLocation =
          await Permission.location.request();
      if (statusLocation.isGranted) {
      } else if (statusLocation.isDenied) {
        if (kDebugMode) {
          print('Location permission denied');
        }
      } else if (statusLocation.isPermanentlyDenied) {
        if (kDebugMode) {
          print('Location permission permanently denied');
        }
        openAppSettings();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  SettingsServices settingsServices = Get.put(SettingsServices());

  RxString lastRead = ''.obs;
  void getLastRead() async {
    if (settingsServices.sharedPref!.getString('lastRead') != null) {
      lastRead.value =
          settingsServices.sharedPref!.getString('lastRead').toString();
      update();
    }
  }

  Future<void> requestNotificationPermission() async {
    try {
      final PermissionStatus statusNotify =
          await Permission.notification.request();
      if (statusNotify.isGranted) {
      } else if (statusNotify.isDenied) {
        if (kDebugMode) {
          print('Location permission denied');
        }
      } else if (statusNotify.isPermanentlyDenied) {
        if (kDebugMode) {
          print('Location permission permanently denied');
        }
        openAppSettings();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  List<String> titles = [
    'القرآن الكريم',
    'حديث',
    'أسماء الله الحسنى ',
    'تفسير',
  ];

  List<String> images = [
    AssetsData.mushaf_1,
    AssetsData.moon,
    AssetsData.nameOfAllah,
    AssetsData.mushaf,
  ];

  List<String> routes = [
    AppRoutes.quranScreen,
    AppRoutes.sectionHadith,
    AppRoutes.nameofAllah,
    AppRoutes.tafsser,
  ];

  List<String> titleListView = [
    'أذكار',
    'مواقيت الصلاة',
    'القبلة',
    'المسبحة',
  ];

  List<String> imageListView = [
    AssetsData.azkar,
    AssetsData.ramadan,
    AssetsData.qiblahImage,
    AssetsData.pngTree,
  ];
  List<String> routesListView = [
    AppRoutes.azkar,
    AppRoutes.adhan,
    AppRoutes.qiblah,
    AppRoutes.pngTree,
  ];

  TextEditingController timeController = TextEditingController();

  var formKey = GlobalKey<FormState>();
}
