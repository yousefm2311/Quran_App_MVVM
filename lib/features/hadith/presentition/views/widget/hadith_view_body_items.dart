// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/core/util/assets.dart';
import 'package:quran_app_android/core/util/color.dart';
import 'package:quran_app_android/core/util/routes/routes.dart';
import 'package:quran_app_android/core/util/widgets/my_text.dart';
import 'package:quran_app_android/features/hadith/presentition/view_model/hadith_view_model.dart';

class HadithViewBodyItems extends StatelessWidget {
  const HadithViewBodyItems(
      {super.key,
      this.model,
      required this.hadithViewModel,
      required this.settingsServices,
      required this.index});
  final model;
  final HadithViewModel hadithViewModel;
  final SettingsServices settingsServices;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        settingsServices.sharedPref!.setInt('indexHadith', index);
        hadithViewModel.hadithRead();
        Get.toNamed(AppRoutes.hadith);
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
                    text: '${hadithViewModel.hadithModelFinal[index].data!.hadiths.length}',
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  )
                ],
              ),
              const Spacer(),
              MyText(
                text: '${model.name}',
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontFamily: 'Rubik',
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
