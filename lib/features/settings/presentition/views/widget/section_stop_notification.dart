// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/service/settings/notifications_services.dart';
import 'package:quran_app/core/util/color.dart';
import 'package:quran_app/core/util/widgets/custom_toast.dart';
import 'package:quran_app/features/settings/presentition/view_model/settins_view_model.dart';
// import 'package:workmanager/workmanager.dart';

class SectionStopNotification extends StatelessWidget {
  const SectionStopNotification({super.key, required this.controller});
  final SettingsViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.white38, borderRadius: BorderRadius.circular(12.0)),
      child: Row(
        children: [
          CupertinoSwitch(
            activeTrackColor: AppColors.kPrimaryColor,
            value:
                controller.settingsServices.sharedPref!.getBool('stop_noti') ??
                    true,
            onChanged: (value) => switchMethod(controller, value),
          ),
          const Spacer(),
          Text(
            'ايقاف وتشغل اشعارات الاذكار',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black87,
                fontSize: 18,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }

  Future<void> switchMethod(SettingsViewModel controller, bool value) async {
    {
      controller.toggleSwitchStopNoti(value);
      if (controller.settingsServices.sharedPref!.getBool('stop_noti') ==
          true) {
        // Workmanager().registerPeriodicTask(
        //   '9',
        //   'scheduler notifications',
        //   existingWorkPolicy: ExistingWorkPolicy.replace,
        //   frequency: const Duration(minutes: 10),
        // );
        defaultToast(text: 'تم تفعيل اشعارات الاذكار ');
      } else {
        defaultToast(text: 'تم ايقاف اشعارات الاذكار ');
        await NotifyHelper().flutterLocalNotificationsPlugin.cancel(20);
      }
    }
  }
}
