// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/core/util/assets.dart';
import 'package:quran_app_android/core/util/color.dart';
import 'package:quran_app_android/features/quran/presentition/view_model/quran_screen_model_details.dart';
import 'package:quran_app_android/features/tafsser/presentition/view_model.dart/tafseer_details_view_model.dart';
import 'package:quran_app_android/features/tafsser/presentition/views/widget/tafseer_details_view/inkwell_book_mark_builder.dart';

import 'package:share_plus/share_plus.dart';

class ContainerBuilderTafseerView extends GetWidget<TafseerDetailsViewModel> {
  const ContainerBuilderTafseerView({
    super.key,
    required this.model,
    required this.tafseerDetailsViewModel,
    required this.settingsServices,
    required this.numberIndex,
    required this.index,
    required this.quranScreenViewModel,
  });
  final model;
  final TafseerDetailsViewModel tafseerDetailsViewModel;
  final QuranScreenViewModel quranScreenViewModel;
  final SettingsServices settingsServices;
  final numberIndex;
  final index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  AssetsData.ayah,
                  width: 30,
                  color: AppColors.kPrimaryColor,
                ),
                Text(
                  "${model.id}",
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Container(),
          const SizedBox(width: 10.0),
          GestureDetector(
            onTap: () async {
              await Share.share(
                model.text.toString().replaceFirst(':', ''),
                sharePositionOrigin:
                    Rect.fromPoints(const Offset(2, 2), const Offset(3, 3)),
              );
            },
            child: const Icon(
              Icons.share,
              size: 20.0,
              color: AppColors.kPrimaryColor,
            ),
          ),
          const SizedBox(width: 10.0),
          GetBuilder<TafseerDetailsViewModel>(builder: (cont) {
            return InkWellTafseerDetailsView(
              cont: cont,
              index: index + 1,
              model: model,
              numberIndex: numberIndex,
              settingsServices: settingsServices,
            );
          }),
          const SizedBox(width: 10.0)
        ],
      ),
    );
  }
}
