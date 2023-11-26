// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:quran_app/features/hadith/presentition/view_model/hadith_view_model.dart';
import 'package:quran_app/features/hadith/presentition/views/widget/resizer_buttons.dart';
import 'package:quran_app/features/hadith/presentition/views/widget/section_bottom.dart';
class HadithDetailsViewBodyItems extends StatelessWidget {
  const HadithDetailsViewBodyItems(
      {super.key,
      required this.index,
      required this.model,
      required this.controller});
  final int index;
  final model;
  final HadithViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue.shade100.withOpacity(.4),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ResizerButtons(controller: controller),
              SizedBox(height: MediaQuery.of(context).size.height * .04),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    '${model.text}',
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
              SectionButtom(index: index,model: model)
            ],
          ),
        ),
      ),
    );
  }
}
