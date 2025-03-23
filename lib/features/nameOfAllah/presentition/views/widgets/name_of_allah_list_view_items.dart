import 'package:flutter/material.dart';
import 'package:quran_app_android/core/util/color.dart';
import 'package:quran_app_android/features/nameOfAllah/data/models/Names_Of_Allah_model.dart';

class NameOfAllahListViewItems extends StatelessWidget {
  const NameOfAllahListViewItems({super.key, required this.model});
  final NamesOfAllahModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue.shade100.withOpacity(.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Text(
              '${model.name}',
              textAlign: TextAlign.justify,
              textDirection: TextDirection.ltr,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontFamily: 'Rubik',
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              '${model.text}',
              textAlign: TextAlign.justify,
              textDirection: TextDirection.ltr,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontFamily: 'Rubik',
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
