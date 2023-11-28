import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/core/util/assets.dart';
import 'package:quran_app/core/util/widgets/custom_appBar.dart';
import 'package:quran_app/core/util/widgets/custom_back_button.dart';
import 'package:quran_app/features/settings/presentition/view_model/settins_view_model.dart';
import 'package:quran_app/features/settings/presentition/views/widget/section_azkar_notification.dart';
import 'package:quran_app/features/settings/presentition/views/widget/section_stop_notification.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal('ar');
    final hijri = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat('EEE , d MMM yyyy');
    var formatted = format.format(day);
    return Scaffold(
      appBar: CustomAppBar(
        loading: const CustomBackButton(),
        title: Text(
          'الاعدادات',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 20,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<SettingsViewModel>(
            init: SettingsViewModel(),
            builder: (controller) {
              return Column(
                children: [
                  Lottie.asset(AssetsData.settings, width: 300),
                  SectionAzkarNotification(controller: controller),
                  const SizedBox(height: 20.0),
                  SectionStopNotification(controller: controller),
                  Text(
                    hijri.hDay.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    hijri.longMonthName.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    formatted.toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
