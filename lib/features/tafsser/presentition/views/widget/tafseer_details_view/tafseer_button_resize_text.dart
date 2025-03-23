import 'package:flutter/material.dart';
import 'package:quran_app_android/core/util/color.dart';
import 'package:quran_app_android/core/util/widgets/custom_toast.dart';
import 'package:quran_app_android/features/tafsser/presentition/view_model.dart/tafseer_details_view_model.dart';

class TafseerBottonResizeText extends StatelessWidget {
  const TafseerBottonResizeText({super.key, required this.tafseerDetailsViewModel});
  final TafseerDetailsViewModel tafseerDetailsViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (tafseerDetailsViewModel.fontSize >= 14) {
                tafseerDetailsViewModel.decreaseFont();
              } else {
                defaultToast(text: 'الخط صغير جداا');
              }
            },
            child: const Icon(
              Icons.remove_circle_outline_rounded,
              color: AppColors.kPrimaryColor,
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () async {
              if (tafseerDetailsViewModel.fontSize <= 24) {
                tafseerDetailsViewModel.increaseFont();
              } else {
                await defaultToast(text: 'الخط كبير جداا');
              }
            },
            child: const Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
