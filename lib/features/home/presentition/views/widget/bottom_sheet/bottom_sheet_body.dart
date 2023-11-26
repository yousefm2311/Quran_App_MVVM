import 'package:flutter/material.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';
import 'package:quran_app/features/home/presentition/view_model/home_view_model.dart';
import 'package:quran_app/features/home/presentition/views/widget/bottom_sheet/button_bottom_sheet.dart';
import 'package:quran_app/features/home/presentition/views/widget/bottom_sheet/text_from_field_bottom_sheet.dart';

class BottomsheetBody extends StatelessWidget {
  const BottomsheetBody(
      {super.key, required this.controller, required this.settingsServices});
  final HomeViewModel controller;
  final SettingsServices settingsServices;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .3,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(12.0), topLeft: Radius.circular(12.0)),
        color: Color.fromRGBO(227, 241, 246, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'اختيار وقت الاذكار يرجي العلم ان اقل وقت هو 15 دقيقة ',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontFamily: 'Rubik',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                ),
                const SizedBox(height: 20),
                TextFormFieldBottomSheet(controller: controller),
                const SizedBox(height: 20),
                ButtonBottomSheet(
                    settingsServices: settingsServices, controller: controller)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
