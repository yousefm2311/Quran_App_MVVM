import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';
import 'package:quran_app/features/quran/presentition/view_model/quran_screen_model_details.dart';
import 'package:quran_app/features/quran/presentition/views/widget/quran_details_list_view_item.dart';

class QuranDetailsListView extends StatelessWidget {
  const QuranDetailsListView({super.key, required this.sharedPref, required this.controller});
  final SettingsServices sharedPref;
  final QuranScreenViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: controller.isLoading.value
              ? const CupertinoActivityIndicator()
              : Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100.withOpacity(.4),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: ListView.separated(
                      shrinkWrap: true,
                      key: PageStorageKey(sharedPref.sharedPref!
                                  .getInt('indexQuran') !=
                              null
                          ? '${sharedPref.sharedPref!.getInt('indexQuran')!.toInt()}'
                          : ''),
                      controller: controller.scrollController,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return QuranDetailsListViewItem(
                          sharedPref: sharedPref,
                          quranScreenViewModel: controller,
                          index: index,
                          model: controller
                              .ayah_Model[sharedPref.sharedPref!
                                  .getInt('indexQuran')!
                                  .toInt()]
                              .verses,
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(),
                      itemCount: 1,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
