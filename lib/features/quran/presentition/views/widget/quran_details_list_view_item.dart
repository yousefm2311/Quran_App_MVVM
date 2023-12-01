// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';
import 'package:quran_app/core/util/color.dart';
import 'package:quran_app/features/quran/presentition/view_model/quran_screen_model_details.dart';

class QuranDetailsListViewItem extends StatelessWidget {
  const QuranDetailsListViewItem({
    super.key,
    required this.sharedPref,
    required this.quranScreenViewModel,
    required this.index,
    required this.model,
  });
  final SettingsServices sharedPref;
  final QuranScreenViewModel quranScreenViewModel;
  final int index;
  final model;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuranScreenViewModel>(
      init: QuranScreenViewModel(),
      builder: (controller2) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sharedPref.sharedPref!.getInt('indexQuran')!.toInt() == 0 ||
                      sharedPref.sharedPref!.getInt('indexQuran')!.toInt() == 8
                  ? Container()
                  : Text(
                      '${quranScreenViewModel.ayah_Model[0].verses[0].text}',
                      style: TextStyle(
                        fontSize: controller2.fontSize + 2,
                        color: Colors.black,
                        fontFamily: 'Kitab',
                      ),
                    ),
              const SizedBox(width: 20),
              Text.rich(
                textScaleFactor: index.toString().length <= 2 ? 1.3 : .8,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.justify,
                TextSpan(
                  children: [
                    for (int i = 0;
                        i <
                            quranScreenViewModel
                                .ayah_Model[sharedPref.sharedPref!
                                    .getInt('indexQuran')!
                                    .toInt()]
                                .verses
                                .length;
                        i++) ...{
                      TextSpan(
                        text: '${model[i].text} ',
                        style: TextStyle(
                          fontSize: controller2.fontSize,
                          color: Colors.black,
                          fontFamily: 'Kitab',
                        ),
                      ),
                      TextSpan(
                        text:
                            ' |${quranScreenViewModel.replaceFarsiNumber(model[i].id.toString())}|  ',
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.kPrimaryColor,
                          fontFamily: 'Quran',
                        ),
                      ),
                      const WidgetSpan(child: SizedBox(width: 1))
                    },
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
