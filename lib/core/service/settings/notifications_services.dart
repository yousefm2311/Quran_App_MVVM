// ignore_for_file: unused_local_variable, unused_element, deprecated_member_use
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/util/constant/static_vars.dart';
import 'package:quran_app/core/util/routes/routes.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final soundAzkar_1 = 'azkar_1.wav';
  final soundAzkar_2 = 'azkar_2.wav';
  final soundAdhan = 'adhan.wav';
  initializeNotification() async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('icon');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  displayNotification() async {
    int rndmIndex = Random().nextInt(StaticVars().smallDo3a2.length - 1);
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      '$rndmIndex.0',
      'your channel name',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      showWhen: false,
      enableVibration: true,
      ticker: 'ticker',
      sound: RawResourceAndroidNotificationSound(soundAzkar_1.split('.').first),
    );
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
      20,
      'فَذَكِّرْ',
      StaticVars().smallDo3a2[rndmIndex],
      notificationDetails,
      payload: AppRoutes.notify,
    );
  }

  void scheduleAzkar({dateTime}) async {
    int rndmIndex = Random().nextInt(StaticVars().smallDo3a2.length - 1);
    String timeString = '10:00';
    final timeParts = timeString.split(':');
    final timeOfDay = TimeOfDay(
        hour: int.parse(timeParts[0]), minute: int.parse(timeParts[1]));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        '1' 'test', 'daily_reminder',
        sound:
            RawResourceAndroidNotificationSound(soundAzkar_2.split('.').first),
        importance: Importance.max,
        priority: Priority.high,
        showWhen: false);
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        'أذكار الصباح',
        StaticVars().smallDo3a2[rndmIndex],
        _nextTest(dateTime: dateTime ?? timeOfDay),
        platformChannelSpecifics,
        payload: AppRoutes.azkar,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  tz.TZDateTime _nextTest({required TimeOfDay dateTime}) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.local, now.year, now.month, now.day, dateTime.hour, dateTime.minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day + 1,
          dateTime.hour, dateTime.minute);
    }
    return scheduledDate;
  }

  Future<void> schedulePrayerTimeNotification({required prayerTimes}) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'prayer_times_channel_id' 'prayer_times_channel_name',
        'prayer_times_channel_description',
        importance: Importance.max,
        priority: Priority.high,
        sound: RawResourceAndroidNotificationSound(soundAdhan.split('.').first),
        showWhen: false);
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    // الفجر
    await flutterLocalNotificationsPlugin.zonedSchedule(
        2,
        'وقت الصلاة',
        'حان الآن وقت صلاة الفجر',
        _nextInstanceOfPrayerTime(prayerTimes.fajr),
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: AppRoutes.notify,
        matchDateTimeComponents: DateTimeComponents.time);
    // الظهر
    await flutterLocalNotificationsPlugin.zonedSchedule(
        3,
        'وقت الصلاة',
        'حان الآن وقت صلاة الظهر',
        _nextInstanceOfPrayerTime(prayerTimes.dhuhr),
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        payload: AppRoutes.notify,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
    // العصر
    await flutterLocalNotificationsPlugin.zonedSchedule(
        4,
        'وقت الصلاة',
        'حان الآن وقت صلاة العصر',
        _nextInstanceOfPrayerTime(prayerTimes.asr),
        platformChannelSpecifics,
        payload: AppRoutes.notify,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
    // المغرب
    await flutterLocalNotificationsPlugin.zonedSchedule(
        5,
        'وقت الصلاة',
        'حان الآن وقت صلاة المغرب',
        _nextInstanceOfPrayerTime(prayerTimes.maghrib),
        platformChannelSpecifics,
        payload: AppRoutes.notify,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
    // العشاء
    await flutterLocalNotificationsPlugin.zonedSchedule(
        6,
        'وقت الصلاة',
        'حان الآن وقت صلاة العشاء',
        _nextInstanceOfPrayerTime(prayerTimes.isha),
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        payload: AppRoutes.notify,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  tz.TZDateTime _nextInstanceOfPrayerTime(DateTime prayerTime) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month,
        now.day, prayerTime.hour, prayerTime.minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day + 1,
          prayerTime.hour, prayerTime.minute);
    }
    return scheduledDate;
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Get.toNamed(payload!);
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    Get.dialog(Text(body!));
  }

  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  //   void scheduleDailyTenAMNotification() async {
  //   int rndmIndex = Random().nextInt(StaticVars().smallDo3a2.length - 1);
  //   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
  //       'daily_reminder_channel_id' 'daily_reminder_channel_name',
  //       'daily_reminder_description',
  //       importance: Importance.max,
  //       priority: Priority.high,
  //       sound:
  //           RawResourceAndroidNotificationSound(soundAzkar_2.split('.').first),
  //       showWhen: false);
  //   var platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //       10,
  //       'أذكار الصباح',
  //       StaticVars().smallDo3a2[rndmIndex],
  //       _nextInstanceOfTenAM(),
  //       platformChannelSpecifics,
  //       androidAllowWhileIdle: true,
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime,
  //       matchDateTimeComponents: DateTimeComponents.time);
  // }
  // tz.TZDateTime _nextInstanceOfTenAM() {
  //   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  //   tz.TZDateTime scheduledDate =
  //       tz.TZDateTime(tz.local, now.year, now.month, now.day, 10, 00);
  //   if (scheduledDate.isBefore(now)) {
  //     scheduledDate =
  //         tz.TZDateTime(tz.local, now.year, now.month, now.day + 1, 10, 00);
  //   }
  //   return scheduledDate;
  // }
}
