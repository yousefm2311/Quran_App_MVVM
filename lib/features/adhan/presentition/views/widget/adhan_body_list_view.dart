import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/features/adhan/presentition/view_model/adhan_view_model.dart';
import 'package:quran_app/features/adhan/presentition/views/widget/adhan_view_data.dart';

class AdhanBodyListView extends StatelessWidget {
  const AdhanBodyListView({super.key, required this.controller});
  final AdhanViewModel controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          PrayerTimeItem(
              time: formateDate(controller.prayerTimes.fajr),
              title: 'الفجر',
              isCurrent: _isCurrentTime(
                  controller.prayerTimes.fajr, controller.prayerTimes.sunrise)),
          PrayerTimeItem(
              time: formateDate(controller.prayerTimes.dhuhr),
              title: 'الظهر',
              isCurrent: _isCurrentTime(
                  controller.prayerTimes.dhuhr, controller.prayerTimes.asr)),
          PrayerTimeItem(
              time: formateDate(controller.prayerTimes.asr),
              title: 'العصر',
              isCurrent: _isCurrentTime(
                  controller.prayerTimes.asr, controller.prayerTimes.maghrib)),
          PrayerTimeItem(
              time: formateDate(controller.prayerTimes.maghrib),
              title: 'المغرب',
              isCurrent: _isCurrentTime(
                  controller.prayerTimes.maghrib, controller.prayerTimes.isha)),
          PrayerTimeItem(
              time: formateDate(controller.prayerTimes.isha),
              title: 'العشاء',
              isCurrent: _isCurrentTime(
                  controller.prayerTimes.isha, controller.prayerTimes.fajr)),
        ],
      ),
    );
  }

  formateDate(date) {
    return DateFormat.jm().format(date);
  }

  bool _isCurrentTime(DateTime prayerTime, DateTime nextPrayerTime) {
    final now = DateTime.now();
    final adjustedPrayerTime = prayerTime;
    final adjustedNextPrayerTime = nextPrayerTime;
    if (now.isAfter(adjustedPrayerTime) &&
        now.isBefore(adjustedNextPrayerTime)) {
      return true;
    } else if (now.isAfter(controller.prayerTimes.isha) ||
        now.isBefore(controller.prayerTimes.fajr)) {
      return true;
    }
    return false;
  }
}
