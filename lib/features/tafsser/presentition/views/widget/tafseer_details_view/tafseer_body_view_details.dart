import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/core/util/constant/constant.dart';
import 'package:quran_app_android/features/quran/presentition/view_model/quran_screen_model_details.dart';
import 'package:quran_app_android/features/tafsser/presentition/view_model.dart/tafseer_details_view_model.dart';
import 'package:quran_app_android/features/tafsser/presentition/views/widget/tafseer_details_view/tafseer_button_resize_text.dart';
import 'package:quran_app_android/features/tafsser/presentition/views/widget/tafseer_details_view/tafseer_list_view_details.dart';
import 'package:quran_app_android/features/tafsser/presentition/views/widget/tafseer_details_view/tafseer_square_surah_details.dart';

class TafseerBodyViewDetails extends StatelessWidget {
  const TafseerBodyViewDetails(
      {super.key,
      required this.quranScreenViewModel,
      required this.settingsServices,
      required this.tafseerDetailsViewModel});
  final QuranScreenViewModel quranScreenViewModel;
  final TafseerDetailsViewModel tafseerDetailsViewModel;
  final SettingsServices settingsServices;
  @override
  Widget build(BuildContext context) {
    return PageStorage(
      bucket: tafseerDetailsViewModel.buckGlobal,
      child: GetBuilder<QuranScreenViewModel>(builder: (con) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TafseetSquareSurahDetails(
                quranScreenViewModel: quranScreenViewModel,
                settingsServices: settingsServices,
              ),
              TafseerBottonResizeText(
                  tafseerDetailsViewModel: tafseerDetailsViewModel),
              settingsServices.sharedPref!.getInt(tafseerIndex)!.toInt() == 0
                  ? Container()
                  : const Align(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        'بسم الله الرحمن الرحيم',
                        style: TextStyle(
                            fontFamily: 'Quran',
                            fontSize: 25.0,
                            color: Colors.black),
                      ),
                    ),
              const SizedBox(height: 20.0),
              Expanded(
                  child: con.isLoading.value
                      ? const CupertinoActivityIndicator()
                      : TafseerListViewDetails(
                          tafseerDetailsViewModel: tafseerDetailsViewModel,
                          quranScreenViewModel: quranScreenViewModel,
                          settingsServices: settingsServices,
                        )),
              const SizedBox(height: 20.0),
            ],
          ),
        );
      }),
    );
  }
}
