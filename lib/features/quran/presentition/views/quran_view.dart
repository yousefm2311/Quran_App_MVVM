// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/core/util/icon_broken.dart';
import 'package:quran_app_android/core/util/widgets/custom_appBar.dart';
import 'package:quran_app_android/core/util/widgets/my_text.dart';
import 'package:quran_app_android/features/home/presentition/view_model/home_view_model.dart';
import 'package:quran_app_android/features/quran/presentition/view_model/quran_screen_model_details.dart';
import 'package:quran_app_android/features/quran/presentition/view_model/quran_view_model.dart';
import 'package:quran_app_android/features/quran/presentition/views/widget/quran_view_body.dart';

class QuranScreen extends GetWidget<QuranViewModel> {
  QuranScreen({super.key});
  SettingsServices settingsServices = Get.put(SettingsServices());
  QuranScreenViewModel quranScreenViewModel = Get.put(QuranScreenViewModel());
  HomeViewModel homeViewModel = Get.put(HomeViewModel());
  QuranViewModel quranViewModel = Get.put(QuranViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          loading: IconButton(
              onPressed: () {
                homeViewModel.getLastRead();
                Get.back();
              },
              icon: const Icon(IconBroken.Arrow___Left_2)),
          centerTitle: true,
          title: MyText(
            text: 'القرآن الكريم',
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 22,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
        ),
        body: GetBuilder<QuranScreenViewModel>(builder: (controller) {
          return QuranViewBody(
              settingsServices: settingsServices,
              quranScreenViewModel: quranScreenViewModel);
        }));
  }
}
