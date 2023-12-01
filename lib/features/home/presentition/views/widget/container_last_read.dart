import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';
import 'package:quran_app/core/util/assets.dart';
import 'package:quran_app/core/util/color.dart';
import 'package:quran_app/core/util/icon_broken.dart';
import 'package:quran_app/core/util/routes/routes.dart';
import 'package:quran_app/core/util/widgets/my_text.dart';
import 'package:quran_app/features/home/presentition/view_model/home_view_model.dart';

class ContainerLastReadView extends StatelessWidget {
  const ContainerLastReadView({super.key, required this.settingsServices});
  final SettingsServices settingsServices;
  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal('ar');
    final hijri = HijriCalendar.now();
    // var day = DateTime.now();
    // var format = DateFormat('EEE , d MMM yyyy');
    // var formatted = format.format(day);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 20,
                ),
              ],
              color: Colors.green,
              gradient: const LinearGradient(
                colors: [
                  AppColors.kPrimaryColor,
                  Color.fromRGBO(122, 198, 150, 1),
                ],
              ),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<HomeViewModel>(builder: (controller) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MyText(
                          text: 'Last Read  آخر قراءة',
                          textStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 13.0,
                                  ),
                        ),
                        settingsServices.sharedPref!.getString('lastRead') ==
                                null
                            ? Container()
                            : MyText(
                                text: controller.lastRead.value,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.white,
                                      fontFamily: 'Rubik',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                        settingsServices.sharedPref!.getString('lastRead') !=
                                null
                            ? GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.detailsScreen);
                                },
                                child: Row(
                                  children: [
                                    MyText(
                                      text: 'Go to',
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Colors.white,
                                            fontSize: 14.0,
                                          ),
                                    ),
                                    const Icon(
                                      IconBroken.Arrow___Right_2,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 20),
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    );
                  }),
                  Image.asset(AssetsData.lantern)
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * .45,
            height: MediaQuery.sizeOf(context).height * .035,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 225, 203, 2),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  topRight: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  hijri.hDay.toString(),
                  style: const TextStyle(
                    color: Colors.red,
                    fontFamily: 'Rubik',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' - ${hijri.longMonthName.toString()} - ',
                  style: const TextStyle(
                    color: Colors.red,
                    fontFamily: 'Rubik',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  hijri.hYear.toString(),
                  style: const TextStyle(
                    color: Colors.red,
                    fontFamily: 'Rubik',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
