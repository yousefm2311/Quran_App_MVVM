import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/util/assets.dart';
import 'package:quran_app/core/util/color.dart';
import 'package:quran_app/core/util/routes/routes.dart';
import 'package:quran_app/core/util/widgets/my_text.dart';

Widget buildListView(
        {index, context, model, settingsServices, quranScreenViewModel}) =>
    GestureDetector(
      onTap: () {
        settingsServices.sharedPref!.setInt('indexQuran', index);
        quranScreenViewModel.readJson();
        Get.toNamed(AppRoutes.detailsScreen);
        settingsServices.sharedPref!.setString('lastRead',
            '${quranScreenViewModel.ayah_Model[settingsServices.sharedPref!.getInt('indexQuran')!.toInt()].transliteration} - ${quranScreenViewModel.ayah_Model[settingsServices.sharedPref!.getInt('indexQuran')!.toInt()].name}');
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue.shade100.withOpacity(.4),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    AssetsData.ayah,
                    color:AppColors.kPrimaryColor,
                    width: 40,
                  ),
                  MyText(
                    text: '${index + 1}',
                    textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  )
                ],
              ),
              const SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: '${model.transliteration}',
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  MyText(
                    text: '${model.type} - ${model.total_verses} verses',
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
              const Spacer(),
              settingsServices.sharedPref!.getInt("currentIndex4Quran") ==
                      model.id
                  ? const Icon(
                      Icons.bookmark,
                      color: AppColors.kPrimaryColor,
                    )
                  : Container(),
              const Spacer(),
              MyText(
                text: model.name,
                textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPrimaryColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
