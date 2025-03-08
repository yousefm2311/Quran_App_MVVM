import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/core/service/settings/notifications_services.dart';
import 'package:quran_app/core/util/color.dart';
import 'package:quran_app/core/util/widgets/custom_toast.dart';
import 'package:quran_app/features/settings/presentition/view_model/settins_view_model.dart';

class SectionAzkarNotification extends StatelessWidget {
  const SectionAzkarNotification({super.key, required this.controller});

  final SettingsViewModel controller;

  @override
  Widget build(BuildContext context) {
    controller.checkNotificationPermissions();
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.white38, borderRadius: BorderRadius.circular(12.0)),
      child: Row(
        children: [
          CupertinoSwitch(
            activeTrackColor: AppColors.kPrimaryColor,
            value: controller.settingsServices.sharedPref!.getBool('enable') ??
                true,
            onChanged: (value) => switchMethod(controller, value),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => showTimePickerMethod(context, controller),
            child: Text(
              'تعديل وايقاف اشعار ذكر الصباح',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black87,
                  fontSize: 18,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Future<void> switchMethod(SettingsViewModel controller, bool value) async {
    {
      if (controller.timeOfDay == null &&
          controller.settingsServices.sharedPref!.getBool('enable') == false) {
        controller.toggleSwitch(value);
        defaultToast(text: 'تم تعيين الوقت الافتراضي');
      }
      controller.toggleSwitch(value);
      if (controller.settingsServices.sharedPref!.getBool('enable') == true) {
        defaultToast(text: 'تم تفعيل اشعار ذكر الصباح');
        NotifyHelper().scheduleAzkar(dateTime: controller.timeOfDay);
      } else {
        defaultToast(text: 'تم ايقاف اشعار ذكر الصباح');
        await NotifyHelper().flutterLocalNotificationsPlugin.cancel(1);
      }
    }
  }

  Future<void> showTimePickerMethod(
      BuildContext context, SettingsViewModel controller) async {
    {
      try {
        final selectedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (selectedTime != null) {
          controller.timeOfDay = selectedTime;
          if (controller.settingsServices.sharedPref!.getBool('enable') ==
              true) {
            NotifyHelper().scheduleAzkar(dateTime: selectedTime);
          }
        }
      } catch (e) {
        defaultToast(text: 'لم يتم تحديد اي وقت وسيتم تحديد الوقت الافتراضي');
      }
    }
  }
}
