import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class QiblahViewModel extends GetxController {
  RxBool isDone = false.obs;

  Future<void> requestLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      status = await Permission.location.request();
    }
    if (status.isGranted) {
      debugPrint('Location permission granted');
      isDone.value = true;
      update();
    } else if (status.isDenied) {
      debugPrint('Location permission denied');
      isDone.value = false;
      update();
    } else if (status.isPermanentlyDenied) {
      debugPrint('Location permission permanently denied');
      await openAppSettings();
      isDone.value = false;
      update();
    }
  }
}
