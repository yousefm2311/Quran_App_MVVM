import 'package:flutter/material.dart';
import 'package:quran_app_android/core/service/settings/SettingsServices.dart';
import 'package:quran_app_android/core/util/assets.dart';
import 'package:quran_app_android/core/util/color.dart';
import 'package:quran_app_android/core/util/constant/constant.dart';
import 'package:quran_app_android/core/util/widgets/my_text.dart';
import 'package:quran_app_android/features/quran/presentition/view_model/quran_screen_model_details.dart';

class TafseetSquareSurahDetails extends StatelessWidget {
  const TafseetSquareSurahDetails(
      {super.key,
      required this.quranScreenViewModel,
      required this.settingsServices});
  final QuranScreenViewModel quranScreenViewModel;
  final SettingsServices settingsServices;

  @override
  Widget build(BuildContext context) {
    var dataModel = quranScreenViewModel
        .ayah_Model[settingsServices.sharedPref!.getInt(tafseerIndex)!.toInt()];
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.kPrimaryColor,
            Color.fromRGBO(122, 198, 150, 1),
          ],
        ),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  AssetsData.ayah,
                  color: Colors.white,
                  width: 40,
                ),
                MyText(
                  text:
                      '${settingsServices.sharedPref!.getInt(tafseerIndex)!.toInt() + 1}',
                  textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            MyText(
              text: '${dataModel.transliteration}',
              textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            MyText(
              text: '${dataModel.translation}',
              textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14.0,
                    color: Colors.grey.shade200,
                  ),
            ),
            const Spacer(),
            MyText(
              text: '${dataModel.type} - ${dataModel.verses.length} Verses ',
              textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14.0,
                    color: Colors.grey.shade100,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
