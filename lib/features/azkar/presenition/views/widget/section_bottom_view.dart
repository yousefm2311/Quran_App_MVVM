// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/core/util/color.dart';
import 'package:quran_app/core/util/widgets/custom_toast.dart';
import 'package:share_plus/share_plus.dart';

class SectionsBottom extends StatelessWidget {
  const SectionsBottom({super.key,required this.model});
  final model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            await Share.share(
                sharePositionOrigin:
                    Rect.fromPoints(const Offset(2, 2), const Offset(3, 3)),
                model.text.toString().replaceFirst(':', ''));
          },
          child: const Icon(
            Icons.share,
            size: 25.0,
            color: AppColors.kPrimaryColor,
          ),
        ),
        const SizedBox(width: 20.0),
        Container(
          width: 55,
          height: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 3,
              color:  AppColors.kPrimaryColor,
            ),
          ),
          child: Text(
            '${model.count}',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: 'Rubik',
                  color: Colors.black,
                  fontSize: 27,
                ),
          ),
        ),
        const SizedBox(width: 20.0),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(
                    text: model.text.toString().replaceFirst(':', '')))
                .then((value) async {
              await defaultToast(text: 'تم النسخ');
            });
          },
          child: const Icon(
            Icons.copy,
            size: 25.0,
            color: AppColors.kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
