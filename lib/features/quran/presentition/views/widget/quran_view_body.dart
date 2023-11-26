import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';
import 'package:quran_app/features/quran/presentition/view_model/quran_screen_model_details.dart';
import 'package:quran_app/features/quran/presentition/view_model/quran_view_model.dart';
import 'package:quran_app/features/quran/presentition/views/widget/quran_view_body_items.dart';

class QuranViewBody extends StatelessWidget {
  const QuranViewBody(
      {super.key,
      required this.settingsServices,
      required this.quranScreenViewModel});

  final SettingsServices settingsServices;
  final QuranScreenViewModel quranScreenViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
      child: GetBuilder<QuranViewModel>(
          init: QuranViewModel(),
          builder: (contr) {
            return Column(
              children: [
                Expanded(
                  child: GetBuilder<QuranViewModel>(builder: (c) {
                    return ListView.separated(
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: buildListView(
                              index: index,
                              context: context,
                              model: c.nameModel[index],
                              settingsServices: settingsServices,
                              quranScreenViewModel: quranScreenViewModel,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(),
                        itemCount: c.nameModel.length);
                  }),
                )
              ],
            );
          }),
    );
  }
}
