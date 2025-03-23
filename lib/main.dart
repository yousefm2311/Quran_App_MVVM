import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/core/service/themes/dark_theme.dart';
import 'package:quran_app_android/core/service/themes/light_theme.dart';
import 'package:quran_app_android/core/util/binding.dart';
import 'package:quran_app_android/core/util/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initService();
  runApp(const MyApp());
}

Future initService() async {
  await Get.putAsync(() => SettingsServices().init());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    setupWorkManager();
  }

  SettingsServices settingsServices = Get.put(SettingsServices());
  Future<void> setupWorkManager() async {
    bool? isWorkManagerRunning = settingsServices.sharedPref!.getBool(
      'isWorkManager',
    );
    if (settingsServices.sharedPref!.getBool('stop_noti') == true) {
      if (isWorkManagerRunning == null || !isWorkManagerRunning) {
        // Workmanager().registerPeriodicTask(
        //   '9',
        //   'scheduler notifications',
        //   existingWorkPolicy: ExistingWorkPolicy.replace,
        //   frequency: const Duration(minutes: 10),
        // );
        await settingsServices.sharedPref!.setBool('isWorkManager', true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboarding,
      initialBinding: Binding(),
      getPages: AppRoutes.routes,
      theme: LightTheme().customLightTheme,
      darkTheme: DarkTheme().customDarkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
