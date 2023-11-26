import 'package:flutter/material.dart';
import 'package:quran_app/core/util/color.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isCurrent == false
                ? AppColors.kbackGroundColor
                : AppColors.kPrimaryColor),
        child: ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: 'Rubik',
                  color: isCurrent == false ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
          ),
          trailing: Text(
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
