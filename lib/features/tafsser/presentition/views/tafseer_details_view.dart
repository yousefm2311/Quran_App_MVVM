// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, dead_code
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/core/util/color.dart';
import 'package:quran_app_android/core/util/constant/constant.dart';
import 'package:quran_app_android/core/util/widgets/custom_appBar.dart';
import 'package:quran_app_android/core/util/widgets/custom_back_button.dart';
import 'package:quran_app_android/core/util/widgets/my_text.dart';
import 'package:quran_app_android/features/quran/presentition/view_model/quran_screen_model_details.dart';
import 'package:quran_app_android/features/quran/presentition/view_model/quran_view_model.dart';
import 'package:quran_app_android/features/tafsser/presentition/view_model.dart/tafseer_details_view_model.dart';
import 'package:quran_app_android/features/tafsser/presentition/views/widget/tafseer_details_view/tafseer_body_view_details.dart';

class TafseerDetailsView extends StatefulWidget {
  const TafseerDetailsView({super.key});
  @override
  State<TafseerDetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<TafseerDetailsView> {
  SettingsServices settingsServices = Get.put(SettingsServices());
  TafseerDetailsViewModel tafseerDetailsViewModel =
      Get.put(TafseerDetailsViewModel());
  QuranScreenViewModel quranScreenViewModel = Get.put(QuranScreenViewModel());
  QuranViewModel quranViewModel = Get.put(QuranViewModel());
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widgetBinding();
    });
    return Scaffold(
        backgroundColor: AppColors.kbackGroundColor,
        appBar: CustomAppBar(
          loading: const CustomBackButton(),
          title: MyText(
            text:
                '${quranScreenViewModel.ayah_Model[settingsServices.sharedPref!.getInt(tafseerIndex)!.toInt()].name}',
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 22,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          centerTitle: true,
        ),
        body: TafseerBodyViewDetails(
          tafseerDetailsViewModel: tafseerDetailsViewModel,
          settingsServices: settingsServices,
          quranScreenViewModel: quranScreenViewModel,
        ));
  }

  void widgetBinding() {
    if (settingsServices.sharedPref!.getInt(changeIndex_3) != null &&
        settingsServices.sharedPref!.getInt(changeIndex_4) != null) {
      if (settingsServices.sharedPref!.getInt(changeIndex_3) ==
              tafseerDetailsViewModel.ayahMod!.id &&
          settingsServices.sharedPref!.getInt(changeIndex_4) ==
              settingsServices.sharedPref!.getInt(tafseerIndex)!.toInt() + 1) {
        tafseerDetailsViewModel.scrollToLastPosition();
      }
    }
  }
}
