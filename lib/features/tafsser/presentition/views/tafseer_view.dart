// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/core/util/widgets/custom_appBar.dart';
import 'package:quran_app_android/core/util/widgets/custom_back_button.dart';
import 'package:quran_app_android/core/util/widgets/my_text.dart';
import 'package:quran_app_android/features/quran/presentition/view_model/quran_screen_model_details.dart';
import 'package:quran_app_android/features/tafsser/presentition/view_model.dart/tafseer_details_view_model.dart';
import 'package:quran_app_android/features/tafsser/presentition/views/widget/tafseer_view/tafseer_body_view.dart';

class TafseerView extends StatelessWidget {
  TafseerView({super.key});
  SettingsServices settingsServices = Get.put(SettingsServices());
  QuranScreenViewModel quranScreenViewModel = Get.put(QuranScreenViewModel());
  TafseerDetailsViewModel tafseerDetailsViewModel =
      Get.put(TafseerDetailsViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        loading: const CustomBackButton(),
        centerTitle: true,
        title: MyText(
          text: 'تفسير الميسر',
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 22,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
      ),
      body: TafseerBodyView(
        quranScreenViewModel: quranScreenViewModel,
        settingsServices: settingsServices,
      ),
    );
  }
}
