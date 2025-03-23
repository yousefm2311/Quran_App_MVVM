// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/core/util/color.dart';
import 'package:quran_app_android/core/util/constant/constant.dart';
import 'package:quran_app_android/core/util/widgets/custom_toast.dart';
import 'package:quran_app_android/features/tafsser/presentition/view_model.dart/tafseer_details_view_model.dart';

class InkWellTafseerDetailsView extends StatelessWidget {
  const InkWellTafseerDetailsView({
    super.key,
    required this.cont,
    required this.index,
    required this.numberIndex,
    required this.settingsServices,
    required this.model,
  });
  final cont;
  final index;
  final numberIndex;
  final SettingsServices settingsServices;
  final model;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TafseerDetailsViewModel>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.addBookMark(model.id, model.text, model.translation);
            controller.changeIndex3(index);
            controller.getCurrentMark();
            controller.changeIndex4(numberIndex.id);
            defaultToast(text: 'تم الحفظ');
          },
          child:
              settingsServices.sharedPref!.getInt(changeIndex_3) == model.id &&
                      settingsServices.sharedPref!.getInt(changeIndex_4) ==
                          settingsServices.sharedPref!
                                  .getInt(tafseerIndex)!
                                  .toInt() +
                              1
                  ? controller.ayahMod!.id != model.id
                      ? const Icon(
                          Icons.bookmark_border_rounded,
                          size: 20.0,
                          color: AppColors.kPrimaryColor,
                        )
                      : const Icon(
                          Icons.bookmark,
                          size: 20.0,
                          color: AppColors.kPrimaryColor,
                        )
                  : const Icon(
                      Icons.bookmark_border_rounded,
                      size: 20.0,
                      color: AppColors.kPrimaryColor,
                    ),
        );
      },
    );
  }
}
