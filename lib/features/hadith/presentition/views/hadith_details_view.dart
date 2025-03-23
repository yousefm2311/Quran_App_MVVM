// ignore_for_file: must_be_immutable, unnecessary_null_comparison
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/core/util/color.dart';
import 'package:quran_app_android/core/util/widgets/custom_appBar.dart';
import 'package:quran_app_android/core/util/widgets/custom_back_button.dart';
import 'package:quran_app_android/core/util/widgets/my_text.dart';
import 'package:quran_app_android/features/hadith/presentition/view_model/hadith_view_model.dart';
import 'package:quran_app_android/features/hadith/presentition/views/widget/hadith_details_view_body.dart';

class HadithView extends GetWidget<HadithViewModel> {
  HadithView({super.key});
  SettingsServices settingsServices = Get.put(SettingsServices());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackGroundColor,
      appBar: CustomAppBar(
        loading: const CustomBackButton(),
        centerTitle: true,
        title: MyText(
          text: 'حديث',
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'Rubik',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GetBuilder<HadithViewModel>(builder: (control) {
          return control.isLoading.value
              ? const Center(child: CupertinoActivityIndicator())
              : HadithDetailsViewBody(
                  control: control, settingsServices: settingsServices);
        }),
      ),
    );
  }
}
