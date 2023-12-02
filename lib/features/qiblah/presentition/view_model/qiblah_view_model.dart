// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quran_app/core/util/color.dart';

class QiblahViewModel extends GetxController {
  RxBool isDone = false.obs;

  Future<void> requestLocationPermission(context) async {
    try {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.locationAlways,
        Permission.locationWhenInUse,
      ].request();
      if (statuses[Permission.location]!.isGranted) {
        isDone.value = true;
        update();
      } else if (statuses[Permission.location]!.isDenied) {
        if (kDebugMode) {
          print('Location permission denied');
        }
        if (statuses[Permission.location]!.isGranted) {
          isDone.value = true;
          update();
        }
        isDone.value = false;
        update();
      } else if (statuses[Permission.location]!.isPermanentlyDenied) {
        if (kDebugMode) {
          print('Location permission permanently denied');
        }
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'الموقع',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontFamily: 'Rubik',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
              ),
              content: Text(
                'الرجاء اعطاء اذن الوصول الي الموقع',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontFamily: 'Rubik',
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    ),
              ),
              actions: <Widget>[
                MaterialButton(
                  child: Text(
                    'اغلاق',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontFamily: 'Rubik',
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 20,
                        ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                MaterialButton(
                  color: AppColors.kPrimaryColor,
                  child: Text(
                    'الاعدادات',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontFamily: 'Rubik',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                  ),
                  onPressed: () {
                    openAppSettings().whenComplete(() {
                      Get.back();
                    });
                    Get.back();
                    update();
                  },
                ),
              ],
            );
          },
        );
        update();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
