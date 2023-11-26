import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/util/icon_broken.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(IconBroken.Arrow___Left_2),
    );
  }
}
