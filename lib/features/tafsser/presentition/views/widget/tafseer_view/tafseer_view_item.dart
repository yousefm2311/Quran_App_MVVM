// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/core/util/assets.dart';
import 'package:quran_app_android/core/util/color.dart';
import 'package:quran_app_android/core/util/constant/constant.dart';
import 'package:quran_app_android/core/util/routes/routes.dart';
import 'package:quran_app_android/core/util/widgets/my_text.dart';
import 'package:quran_app_android/features/quran/presentition/view_model/quran_screen_model_details.dart';

class TafseerViewItem extends StatelessWidget {
  const TafseerViewItem({
    super.key,
    required this.settingsServices,
    required this.quranScreenViewModel,
    required this.index,
    required this.model,
  });

  final SettingsServices settingsServices;
  final QuranScreenViewModel quranScreenViewModel;
  final model;
  final index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        settingsServices.sharedPref!.setInt(tafseerIndex, index);
        quranScreenViewModel.readJson();
        Get.toNamed(AppRoutes.detailsTafseer);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue.shade100.withOpacity(.4),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    AssetsData.ayah,
                    color: AppColors.kPrimaryColor,
                    width: 40,
                  ),
                  MyText(
                    text: '${index + 1}',
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  )
                ],
              ),
              const SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: '${model.transliteration}',
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  MyText(
                    text: '${model.type} - ${model.total_verses} verses',
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
              const Spacer(),
              settingsServices.sharedPref!.getInt(changeIndex_4) == model.id
                  ? const Icon(
                      Icons.bookmark,
                      color: AppColors.kPrimaryColor,
                    )
                  : Container(),
              const Spacer(),
              MyText(
                text: model.name,
                textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPrimaryColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
