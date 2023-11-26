import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';
import 'package:quran_app/core/util/assets.dart';
import 'package:quran_app/core/util/color.dart';
import 'package:quran_app/core/util/widgets/my_text.dart';
import 'package:quran_app/features/azkar/data/models/azkar_model.dart';
import 'package:quran_app/core/util/routes/routes.dart';

class AzkarListView extends StatelessWidget {
  const AzkarListView({
    super.key,
    required this.settingsServices,
    required this.index,
    required this.model,
  });

  final SettingsServices settingsServices;
  final AzkarModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        settingsServices.sharedPref!.setInt('indexAzkar', index);
        Get.toNamed(AppRoutes.azkarDetails);
      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blue.shade100.withOpacity(.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    AssetsData.ayah,
                    color: AppColors.kPrimaryColor,
                    width: 40,
                  ),
                  MyText(
                    text: '${model.array.length}',
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MyText(
                text: '${model.category}',
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontFamily: 'Rubik',
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
