import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/util/color.dart';
import 'package:quran_app/core/util/widgets/custom_appBar.dart';
import 'package:quran_app/core/util/widgets/custom_back_button.dart';
import 'package:quran_app/core/util/widgets/my_text.dart';
import 'package:quran_app/features/nameOfAllah/presentition/view_model/Names_Of_Allah_view_model.dart';
import 'package:quran_app/features/nameOfAllah/presentition/views/widgets/name_of_allah_list_view.dart';

class NameOfAllahView extends GetWidget<NamesOfAllahViewModel> {
  const NameOfAllahView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackGroundColor,
      appBar: CustomAppBar(
        loading: const CustomBackButton(),
        centerTitle: true,
        title: MyText(
          text: 'أسماء الله الحسنى ',
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'Rubik',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
        ),
      ),
      body: GetBuilder<NamesOfAllahViewModel>(
          init: NamesOfAllahViewModel(),
          builder: (controller) {
            return NameOfAllahListView(contoller: controller);
          }),
    );
  }
}
