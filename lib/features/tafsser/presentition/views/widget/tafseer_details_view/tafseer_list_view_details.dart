// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';
import 'package:quran_app/features/tafsser/presentition/view_model.dart/tafseer_details_view_model.dart';
import 'package:quran_app/features/quran/presentition/view_model/quran_screen_model_details.dart';
import 'package:quran_app/features/tafsser/presentition/views/widget/tafseer_details_view/container_builder.dart';
import 'package:quran_app/features/tafsser/presentition/views/widget/tafseer_details_view/read_more_text.dart';

import 'package:quran_app/core/util/constant/constant.dart';

class TafseerListViewDetails extends StatelessWidget {
  const TafseerListViewDetails({
    super.key,
    required this.settingsServices,
    required this.quranScreenViewModel,
    required this.tafseerDetailsViewModel,
  });
  final SettingsServices settingsServices;
  final QuranScreenViewModel quranScreenViewModel;
  final TafseerDetailsViewModel tafseerDetailsViewModel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TafseerDetailsViewModel>(
        builder: (controllerTafseerDetailsViewModel) {
      return ListView.separated(
        key: PageStorageKey(
            '${settingsServices.sharedPref!.getInt(tafseerIndex)!.toInt()}'),
        controller: tafseerDetailsViewModel.scrollController,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GetBuilder<QuranScreenViewModel>(builder: (controller2) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContainerBuilderTafseerView(
                  quranScreenViewModel: quranScreenViewModel,
                  index: index,
                  model: controller2
                      .ayah_Model[settingsServices.sharedPref!
                          .getInt(tafseerIndex)!
                          .toInt()]
                      .verses[index],
                  numberIndex: controller2.ayah_Model[settingsServices
                      .sharedPref!
                      .getInt(tafseerIndex)!
                      .toInt()],
                  settingsServices: settingsServices,
                  tafseerDetailsViewModel: tafseerDetailsViewModel,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child:
                            GetBuilder<QuranScreenViewModel>(builder: (cont) {
                          return Text(
                            style: TextStyle(
                                fontSize:
                                    controllerTafseerDetailsViewModel.fontSize,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.right,
                            cont
                                .ayah_Model[settingsServices.sharedPref!
                                    .getInt(tafseerIndex)!
                                    .toInt()]
                                .verses[index]
                                .text
                                .toString(),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                ReadMore(
                    tafseerModel: tafseerDetailsViewModel
                        .tafaseerModel[settingsServices.sharedPref!
                            .getInt(tafseerIndex)!
                            .toInt()]
                        .data[index])
              ],
            );
          });
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: quranScreenViewModel
            .ayah_Model[
                settingsServices.sharedPref!.getInt(tafseerIndex)!.toInt()]
            .verses
            .length,
      );
    });
  }
}
