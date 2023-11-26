// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';
import 'package:quran_app/core/util/widgets/custom_appBar.dart';
import 'package:quran_app/core/util/widgets/custom_back_button.dart';
import 'package:quran_app/core/util/widgets/my_text.dart';
import 'package:quran_app/features/azkar/presenition/view_model/azkar_view_model.dart';
import 'package:quran_app/features/azkar/presenition/views/widget/azkar_list_view_body_details.dart';

class DetailesAzkarView extends GetWidget<AzkarViewModel> {
  DetailesAzkarView({super.key});
  SettingsServices settingsServices = Get.put(SettingsServices());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          centerTitle: true,
          loading: const CustomBackButton(),
          title: MyText(
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: 'Rubik',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
            text:
                "${controller.azkarModel[settingsServices.sharedPref!.getInt('indexAzkar')!.toInt()].category}",
          ),
        ),
        body: AzkarListViewBodyDetails(
            controller: controller, settingsServices: settingsServices));
  }
}
