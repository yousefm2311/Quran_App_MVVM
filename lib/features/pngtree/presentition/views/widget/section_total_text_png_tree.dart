import 'package:flutter/material.dart';
import 'package:quran_app_android/core/util/widgets/my_text.dart';
import 'package:quran_app_android/features/pngtree/presentition/view_model/pngTree_view_model.dart';

class SectionTotalText extends StatelessWidget {
  const SectionTotalText({super.key, required this.controller});
  final PngTreeViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText(
          text: 'TOTAL ',
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                fontFamily: 'Rubik',
              ),
        ),
        MyText(
          text: '${controller.counterTree}',
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                fontFamily: 'Rubik',
              ),
        ),
      ],
    );
  }
}
