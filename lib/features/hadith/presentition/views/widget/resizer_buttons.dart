
import 'package:flutter/material.dart';
import 'package:quran_app_android/core/util/color.dart';
import 'package:quran_app_android/core/util/widgets/custom_toast.dart';
import 'package:quran_app_android/features/hadith/presentition/view_model/hadith_view_model.dart';

class ResizerButtons extends StatelessWidget {
  const ResizerButtons({super.key, required this.controller});

  final HadithViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (controller.fontSize >= 14) {
              controller.decreaseFont();
            } else {
              defaultToast(text: 'الخط صغير جداا');
            }
          },
          child: const Icon(
            Icons.remove_circle_outline_rounded,
            color: AppColors.kPrimaryColor,
            size: 30,
          ),
        ),
        const SizedBox(width: 10.0),
        GestureDetector(
          onTap: () async {
            if (controller.fontSize <= 24) {
              controller.increaseFont();
            } else {
              await defaultToast(text: 'الخط كبير جداا');
            }
          },
          child: const Icon(
            size: 30,
            Icons.add_circle_outline_rounded,
            color: AppColors.kPrimaryColor,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
