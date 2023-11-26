// ignore_for_file: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';
import 'package:quran_app/features/hadith/presentition/view_model/hadith_view_model.dart';
import 'package:quran_app/features/hadith/presentition/views/widget/hadith_view_body_items.dart';

class HadithViewBody extends StatelessWidget {
  HadithViewBody({super.key, required this.controller});
  final HadithViewModel controller;
  HadithViewModel hadithViewModel = Get.put(HadithViewModel());
  SettingsServices settingsServices = Get.put(SettingsServices());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GetBuilder<HadithViewModel>(
            builder: (c) {
              return controller.isLoadingg.value
                  ? const Center(child: CupertinoActivityIndicator())
                  : ListView.separated(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: HadithViewBodyItems(
                              settingsServices: settingsServices,
                              hadithViewModel: hadithViewModel,
                              model: controller.hadithModelFinal[index].data!
                                  .metadata!.section,
                              index: index),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(),
                      itemCount: 61,
                    );
            },
          ),
        ),
      ],
    );
  }
}
