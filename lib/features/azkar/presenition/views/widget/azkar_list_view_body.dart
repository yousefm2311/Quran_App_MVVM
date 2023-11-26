import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';
import 'package:quran_app/features/azkar/presenition/view_model/azkar_view_model.dart';
import 'package:quran_app/features/azkar/presenition/views/widget/azkar_list_view.dart';

class AzkarListViewBody extends StatelessWidget {
  const AzkarListViewBody({super.key, required this.settingsServices});
  final SettingsServices settingsServices;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      child: GetBuilder<AzkarViewModel>(
          init: AzkarViewModel(),
          builder: (control) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => AzkarListView(
                  settingsServices: settingsServices,
                  index: index,
                  model: control.azkarModel[index]),
              separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
              itemCount: control.azkarModel.length,
            );
          }),
    );
  }
}
