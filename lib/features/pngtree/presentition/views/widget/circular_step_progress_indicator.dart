import 'package:flutter/material.dart';
import 'package:quran_app_android/core/util/color.dart';
import 'package:quran_app_android/core/util/widgets/my_text.dart';
import 'package:quran_app_android/features/pngtree/presentition/view_model/pngTree_view_model.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class CircularStepProgressIndicatorView extends StatelessWidget {
  const CircularStepProgressIndicatorView(
      {super.key, required this.controller});
  final PngTreeViewModel controller;

  @override
  Widget build(BuildContext context) {
    return CircularStepProgressIndicator(
      totalSteps: 33,
      currentStep: controller.counter,
      stepSize: 10,
      selectedColor: AppColors.kPrimaryColor,
      unselectedColor: const Color.fromRGBO(227, 241, 246, 1),
      padding: 0,
      width: 220,
      height: 220,
      selectedStepSize: 15,
      roundedCap: (_, __) => true,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            const BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(4, 4),
              spreadRadius: 1,
            ),
            BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 5,
                offset: const Offset(.5, 1),
                spreadRadius: 3,
                blurStyle: BlurStyle.inner),
            BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 5,
                offset: const Offset(-1, -1),
                spreadRadius: 3,
                blurStyle: BlurStyle.inner),
          ],
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              text: '${controller.counter}',
              textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontFamily: 'Rubik',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 60.0,
                  ),
            ),
            MyText(
              text: '33',
              textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontFamily: 'Rubik',
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
