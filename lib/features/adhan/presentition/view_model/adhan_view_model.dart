// ignore_for_file: unrelated_type_equality_checks, prefer_typing_uninitialized_variables
import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quran_app/core/service/database/database_helper.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';
import 'package:quran_app/core/service/settings/notifications_services.dart';
import 'package:quran_app/features/quran/presentition/view_model/quran_screen_model_details.dart';

class AdhanViewModel extends GetxController {
  AdhanViewModel() {
    requestLocationPermission().then((value) => getCurrentLocation());
  }
  double? latitude, longitude;
  RxBool isLoading = false.obs;
  SettingsServices settingsServices = Get.put(SettingsServices());
  LocalStorageAdhanData localData = Get.put(LocalStorageAdhanData());
  QuranScreenViewModel quranScreenViewModel = Get.put(QuranScreenViewModel());
  Future<void> requestLocationPermission() async {
    try {
      final PermissionStatus statusLocation =
          await Permission.location.request();
      if (statusLocation.isGranted) {
        getCurrentLocation().then((value) => adhan());
        update();
        if (kDebugMode) {
          print('Location permission granted');
        }
      } else if (statusLocation.isDenied) {
        if (kDebugMode) {
          print('Location permission denied');
        }
        Get.back();
      } else if (statusLocation.isPermanentlyDenied) {
        if (kDebugMode) {
          print('Location permission permanently denied');
        }
        openAppSettings().whenComplete(() {
          Get.back();
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      isLoading.value = true;
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      latitude = position.latitude;
      longitude = position.longitude;
      isLoading.value = false;
      adhan();
      update();
    } catch (e) {
      isLoading.value = false;
      if (kDebugMode) {
        print("Error getting location: $e");
      }
      update();
    }
  }

  var prayerTimes;
  void adhan() async {
    final myCoordinates = Coordinates(latitude!, longitude!);
    final param = CalculationMethod.egyptian.getParameters();
    param.madhab = Madhab.shafi;
    prayerTimes = PrayerTimes.today(myCoordinates, param);
    update();
    await NotifyHelper()
        .schedulePrayerTimeNotification(prayerTimes: prayerTimes);
  }

  // AdhanModel? adhanModel;
  // AdhanModel? adhanModelShared;
  // RxBool isLoadingAdhan = false.obs;
  // void getAdhan() async {
  //   try {
  //     if (quranScreenViewModel.isOnline.value) {
  //       isLoadingAdhan.value = true;
  //       Adhan_Dio_Helper.getData(
  //         url: 'calendar?',
  //         query: {
  //           'month': currentDate.month.toString(),
  //           'year': currentDate.year.toString(),
  //           'day': currentDate.day.toString(),
  //           'latitude': latitude,
  //           'longitude': longitude,
  //           'method': '5',
  //         },
  //       ).then(
  //         (value) async {
  //           DateTime now = DateTime.now();
  //           String formattedDate = DateFormat('dd-MM-yyyy').format(now);
  //           adhanModel = AdhanModel.fromJson(value.data);
  //           isLoadingAdhan.value = false;
  //           for (int i = 0; i < adhanModel!.data.length; i++) {
  //             localData.setData(adhanModel!);
  //             localData.getUser.then((value) {
  //               adhanModelShared = value;
  //             });
  //             if (adhanModel!.data[i].date!.gregorian!.date == formattedDate) {}
  //           }
  //           update();
  //           // if (kDebugMode) {
  //           //   for (int i = 0; i < adhanModel!.data.length; i++) {
  //           //     if (adhanModel!.data[i].date!.gregorian!.date! == formattedDate) {
  //           //       print(adhanModel!.data[i].timings!.dhuhr);
  //           //       print(adhanModel!.data[i].meta!.timezone);
  //           //       print(adhanModel!.data[i].date!.readable);
  //           //       print(adhanModel!.data[i].date!.hijri!.date);
  //           //     }
  //           //   }
  //           // }
  //         },
  //       );
  //     } else {
  //       // if (adhanModelShared!.data.isNotEmpty) {
  //       //   isLoadingAdhan.value = false;
  //       //   localData.getUser.then((value) {
  //       //     adhanModelShared = value;
  //       //   });
  //       //   update();
  //       // } else {
  //       isLoadingAdhan.value = true;
  //       localData.getUser.then((value) {
  //         adhanModelShared = value;
  //         isLoadingAdhan.value = false;
  //       });
  //       update();
  //       // }
  //     }
  //   } catch (e) {
  //     isLoadingAdhan.value = false;
  //     update();
  //     if (kDebugMode) {
  //       print(e.toString());
  //     }
  //   }
  // }
  // PageController pageController =
  //     PageController(initialPage: DateTime.now().day - 1);
  // String convertTo12HourFormat(String time24) {
  //   if (time24.isEmpty) {
  //     return 'Invalid time format';
  //   }
  //   time24 = time24.replaceAll(RegExp(r'\([^)]*\)'), '');
  //   final timeParts = time24.split(":");
  //   if (timeParts.length != 2) {
  //     return 'Invalid time format';
  //   }
  //   try {
  //     final hour = int.parse(timeParts[0]);
  //     final minute = int.parse(timeParts[1]);
  //     if (hour >= 0 && hour <= 12) {
  //       return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} AM';
  //     } else {
  //       final formattedHour = (hour - 12).toString().padLeft(2, '0');
  //       return '$formattedHour:${minute.toString().padLeft(2, '0')} PM';
  //     }
  //   } catch (e) {
  //     return 'Invalid time format';
  //   }
  // }
}
