// ignore_for_file: file_names

import 'package:get/get.dart';

class PngTreeViewModel extends GetxController {
  int counter = 0;
  int counterTree = 0;

  void increaseCounter() {
    counter++;
    if (counter == 33) {
      counterTree += 1;
      counter = 0;
    }
    update();
  }

  void decreaseCounter() {
    if (counter > 0) {
      counter--;
    }
    update();
  }

  void clearConter() {
    counter = 0;
    counterTree = 0;
    update();
  }
}
