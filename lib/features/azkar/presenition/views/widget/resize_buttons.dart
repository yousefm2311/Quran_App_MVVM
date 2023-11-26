import 'package:flutter/material.dart';
import 'package:quran_app/core/util/color.dart';
import 'package:quran_app/core/util/widgets/custom_toast.dart';
import 'package:quran_app/features/azkar/presenition/view_model/azkar_view_model.dart';

class ResizeButtons extends StatelessWidget {
  const ResizeButtons({super.key, required this.controller});
  final AzkarViewModel controller;

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
          onTap: () {
            if (controller.fontSize <= 24) {
              controller.increaseFont();
            } else {
              defaultToast(text: 'الخط كبير جداا');
            }
          },
          child: const Icon(
            size: 30,
            Icons.add_circle_outline_rounded,
            color: AppColors.kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
