// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class QiblahViewModel extends GetxController {
  RxBool isDone = false.obs;

  Future<void> requestLocationPermission(context) async {
    try {
      final PermissionStatus statusLocation =
          await Permission.location.request();
      if (statusLocation.isGranted) {
        isDone.value = true;
        update();
      } else if (statusLocation.isDenied) {
        if (kDebugMode) {
          print('Location permission denied');
        }
        if (statusLocation.isDenied) {
          isDone.value = true;
          update();
        }
        isDone.value = false;
        update();
      } else if (statusLocation.isPermanentlyDenied) {
        if (kDebugMode) {
          print('Location permission permanently denied');
        }
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Permission Request',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontFamily: 'Rubik',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
              ),
              content: Text(
                'Please grant access to your Location ',
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
                    'Cancel',
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
                  child: Text(
                    'Open Settings',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontFamily: 'Rubik',
                          color: Colors.black,
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