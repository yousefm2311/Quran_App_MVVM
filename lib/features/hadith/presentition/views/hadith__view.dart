// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/util/widgets/custom_appBar.dart';
import 'package:quran_app/core/util/widgets/custom_back_button.dart';
import 'package:quran_app/core/util/widgets/my_text.dart';
import 'package:quran_app/features/hadith/presentition/view_model/hadith_view_model.dart';
import 'package:quran_app/features/hadith/presentition/views/widget/hadith_view_body.dart';

class SectionHadithView extends GetWidget<HadithViewModel> {
  const SectionHadithView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        loading: const CustomBackButton(),
        title: MyText(
          text: 'الحديث',
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'Rubik',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
        child: GetBuilder<HadithViewModel>(
            init: HadithViewModel(),
            builder: (controller) {
              return HadithViewBody(controller: controller);
            }),
      ),
    );
  }
}
