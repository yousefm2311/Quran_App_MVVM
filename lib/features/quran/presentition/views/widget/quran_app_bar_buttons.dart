import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';
import 'package:quran_app/core/util/color.dart';
import 'package:quran_app/core/util/widgets/custom_toast.dart';
import 'package:quran_app/features/quran/presentition/view_model/quran_screen_model_details.dart';

class QuranAppBarButtons extends StatelessWidget {
  const QuranAppBarButtons(
      {super.key,
      required this.sharedPref,
      required this.quranScreenViewModel});
  final SettingsServices sharedPref;
  final QuranScreenViewModel quranScreenViewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GetBuilder<QuranScreenViewModel>(builder: (cont) {
          return GestureDetector(
            onTap: () {
              addBookMark(cont);
            },
            child: sharedPref.sharedPref!.getInt("currentIndex3Quran") ==
                        quranScreenViewModel
                            .ayah_Model[sharedPref.sharedPref!
                                .getInt('indexQuran')!
                                .toInt()]
                            .verses[0]
                            .id &&
                    sharedPref.sharedPref!.getInt("currentIndex4Quran") ==
                        sharedPref.sharedPref!.getInt('indexQuran')!.toInt() + 1
                ? cont.ayahModell == null
                    ? const Icon(
                        Icons.bookmark_border_rounded,
                        size: 25.0,
                        color: AppColors.kPrimaryColor,
                      )
                    : const Icon(
                        Icons.bookmark,
                        size: 25.0,
                        color: AppColors.kPrimaryColor,
                      )
                : const Icon(
                    Icons.bookmark_border_rounded,
                    size: 25.0,
                    color: AppColors.kPrimaryColor,
                  ),
          );
        }),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            if (quranScreenViewModel.fontSize >= 14) {
              quranScreenViewModel.decreaseFont();
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
            if (quranScreenViewModel.fontSize <= 24) {
              quranScreenViewModel.increaseFont();
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
    );
  }

  void addBookMark(QuranScreenViewModel cont) {
    quranScreenViewModel.currentSave =
        sharedPref.sharedPref!.getBool('Save') ?? false;
    cont.addBookMarkQuran(
      quranScreenViewModel
          .ayah_Model[sharedPref.sharedPref!.getInt('indexQuran')!.toInt()]
          .verses[0]
          .id,
      quranScreenViewModel
          .ayah_Model[sharedPref.sharedPref!.getInt('indexQuran')!.toInt()]
          .verses[0]
          .text,
      quranScreenViewModel
          .ayah_Model[sharedPref.sharedPref!.getInt('indexQuran')!.toInt()]
          .verses[0]
          .translation,
    );
    cont.changeIndex3Quran(1);
    cont.changeIndex4Quran(quranScreenViewModel
        .ayah_Model[sharedPref.sharedPref!.getInt('indexQuran')!.toInt()].id);
    cont.getCurrentMarkQuran();
    if (quranScreenViewModel.currentSave == false) {
      Get.defaultDialog(
        
              titleStyle: const TextStyle(color: Colors.black87),
              title: '',
              content: const Text(
                'للحفظ مره اخري اضغط علي نفس الزر',
                style: TextStyle(color: Colors.black87),
              ),
              middleText: '')
          .then((value) {
        sharedPref.sharedPref!.setBool('Save', true);
      });
    }
    defaultToast(text: 'تم الحفظ');
  }
}
