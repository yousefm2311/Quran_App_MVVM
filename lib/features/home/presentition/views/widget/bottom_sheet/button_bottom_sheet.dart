import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';
import 'package:quran_app/core/util/color.dart';
import 'package:quran_app/core/util/widgets/my_text.dart';
import 'package:quran_app/features/home/presentition/view_model/home_view_model.dart';

class ButtonBottomSheet extends StatelessWidget {
  const ButtonBottomSheet({super.key, required this.settingsServices, required this.controller});

  final SettingsServices settingsServices;
  final HomeViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.kPrimaryColor,
      ),
      child: MaterialButton(
        onPressed: () {
          if (controller.formKey.currentState!.validate()) {
            try {
              int time = int.parse(controller.timeController.text);
              settingsServices.sharedPref!.setInt('time', time).then((value) {
                Get.back();
              });
            } catch (e) {
              debugPrint('Failed to set time ${e.toString()}');
            }
          }
        },
        child: MyText(
          text: 'حفظ',
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'Rubik',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
        ),
      ),
    );
  }
}
