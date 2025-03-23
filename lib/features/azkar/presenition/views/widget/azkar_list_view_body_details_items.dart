// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:quran_app_android/features/azkar/presenition/view_model/azkar_view_model.dart';
import 'package:quran_app_android/features/azkar/presenition/views/widget/resize_buttons.dart';
import 'package:quran_app_android/features/azkar/presenition/views/widget/section_bottom_view.dart';

class AzkarListViewBodyDetailsItems extends StatelessWidget {
  const AzkarListViewBodyDetailsItems(
      {super.key, required this.model, required this.controller});

  final model;
  final AzkarViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue.shade100.withOpacity(.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ResizeButtons(controller: controller),
              SizedBox(height: MediaQuery.of(context).size.height * .04),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    '${model.text.replaceAll('(', '').replaceAll(')', '')}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontFamily: 'Rubik',
                          color: Colors.black,
                          fontSize: controller.fontSize,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              SectionsBottom(model: model)
            ],
          ),
        ),
      ),
    );
  }
}
