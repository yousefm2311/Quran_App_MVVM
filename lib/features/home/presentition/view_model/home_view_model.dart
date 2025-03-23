import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_widget/home_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/core/util/assets.dart';
import 'package:quran_app_android/core/util/constant/static_vars.dart';
import 'package:quran_app_android/core/util/routes/routes.dart';

class HomeViewModel extends GetxController {
  HomeViewModel() {
    requestPermissions();
    getLastRead();
  }
  Future<void> requestPermissions() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      status = await Permission.location.request();
    }
    if (status.isGranted) {
      debugPrint('Location permission granted');
    } else if (status.isDenied) {
      debugPrint('Location permission denied');
    } else if (status.isPermanentlyDenied) {
      debugPrint('Location permission permanently denied');
      await openAppSettings();
    }
    var notificationStatus = await Permission.notification.status;
    if (!notificationStatus.isGranted) {
      notificationStatus = await Permission.notification.request();
    }
    if (notificationStatus.isGranted) {
      debugPrint('Notification permission granted');
    } else if (notificationStatus.isDenied) {
      debugPrint('Notification permission denied');
    } else if (notificationStatus.isPermanentlyDenied) {
      debugPrint('Notification permission permanently denied');
    }else{
      debugPrint('Notification permission granted');
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

  String currentZekr = 'سبحان الله';
  String appGroupId = 'group.com.homeScreenApp';
  String iOSWidgetName = 'MyHomeWidget';
  String androidWidgetName = 'MyHomeWidget';
  String dataKey = 'currentZekr';
  final StaticVars staticVars = StaticVars();
  @override
  void onInit() {
    super.onInit();
    HomeWidget.setAppGroupId(appGroupId);
    _updateWidget();
  }

  void _updateWidget() async {
    final randomIndex = DateTime.now().second % staticVars.smallDo3a2.length;
    currentZekr = staticVars.smallDo3a2[randomIndex];
    await HomeWidget.saveWidgetData(dataKey, currentZekr);
    await HomeWidget.saveWidgetData('deepLink', 'quranapp://azkar');
    await HomeWidget.updateWidget(
      iOSName: iOSWidgetName,
      androidName: androidWidgetName,
    );
  }

  // void startBackgroundFetch() {
  //   BackgroundFetch.start().then((status) {
  //     print('BackgroundFetch started: $status');
  //   });
  // }

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
