import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';
import 'package:quran_app/features/azkar/presenition/view_model/azkar_view_model.dart';
import 'package:quran_app/features/azkar/presenition/views/widget/azkar_list_view_body_details_items.dart';

class AzkarListViewBodyDetails extends StatelessWidget {
  const AzkarListViewBodyDetails(
      {super.key, required this.controller, required this.settingsServices});

  final AzkarViewModel controller;
  final SettingsServices settingsServices;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GetBuilder<AzkarViewModel>(builder: (control) {
        return PageView.builder(
          onPageChanged: (value) {
            controller.changeIndex(value);
          },
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemBuilder: (context, index) {
            var scale = controller.currentIndex == index ? 1.0 : 0.9;
            return TweenAnimationBuilder(
              tween: Tween(begin: scale, end: scale),
              duration: const Duration(milliseconds: 350),
              builder: (context, double value, child) {
                return Transform.scale(
                  scale: value,
                  child: child,
                );
              },
              child: AzkarListViewBodyDetailsItems(
                model: control
                    .azkarModel[settingsServices.sharedPref!
                        .getInt('indexAzkar')!
                        .toInt()]
                    .array[index],
                controller: controller,
              ),
            );
          },
          itemCount: control
              .azkarModel[
                  settingsServices.sharedPref!.getInt('indexAzkar')!.toInt()]
              .array
              .length,
        );
      }),
    );
  }
}
