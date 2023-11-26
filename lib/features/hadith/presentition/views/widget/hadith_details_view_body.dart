import 'package:flutter/material.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';
import 'package:quran_app/features/hadith/presentition/view_model/hadith_view_model.dart';
import 'package:quran_app/features/hadith/presentition/views/widget/hadith_details_view_body_items.dart';

class HadithDetailsViewBody extends StatelessWidget {
  const HadithDetailsViewBody(
      {super.key, required this.control, required this.settingsServices});

  final HadithViewModel control;
  final SettingsServices settingsServices;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (value) {
        control.changeIndex(value);
      },
      controller: control.pageController,
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      itemBuilder: (context, index) {
        var scale = control.currentIndex == index ? 1.0 : 0.9;
        return TweenAnimationBuilder(
          tween: Tween(begin: scale, end: scale),
          duration: const Duration(milliseconds: 350),
          builder: (context, double value, child) {
            return Transform.scale(
              scale: value,
              child: child,
            );
          },
          child: HadithDetailsViewBodyItems(
            index: index,
            controller: control,
            model: control
                .hadithModelFinal[
                    settingsServices.sharedPref!.getInt('indexHadith')!.toInt()]
                .data!
                .hadiths[index],
          ),
        );
      },
      itemCount: control
          .hadithModelFinal[
              settingsServices.sharedPref!.getInt('indexHadith')!.toInt()]
          .data!
          .hadiths
          .length,
    );
  }
}
