import 'package:flutter/material.dart';
import 'package:quran_app_android/core/util/color.dart';
class PrayerTimeItem extends StatelessWidget {
  const PrayerTimeItem(
      {super.key,
      required this.title,
      required this.time,
      required this.isCurrent});
  final String title;
  final String time;
  final bool isCurrent;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isCurrent == false
                ? AppColors.kbackGroundColor
                : AppColors.kPrimaryColor),
        child: ListTile(
          trailing: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: 'Rubik',
                  color: isCurrent == false ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
          ),
          title: Text(
            time,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: 'Rubik',
                  color: isCurrent == false ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
          ),
        ),
      ),
    );
  }
}
