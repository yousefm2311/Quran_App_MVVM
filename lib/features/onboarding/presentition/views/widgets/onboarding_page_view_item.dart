// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
class OnBoardingPageViewItems extends StatelessWidget {
  const OnBoardingPageViewItems({super.key, required this.index,required this.model});
  final int index;
  final   model;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          model.image,
          height: MediaQuery.sizeOf(context).height * .4,
        ),
        index != 2 || index != 3
            ? const SizedBox(height: 20.0)
            : const SizedBox(),
        Text(
          model.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'Rubik',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
        ),
        const SizedBox(height: 20.0),
        Text(
          model.description,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'Rubik',
                color: Colors.grey.shade700,
                fontSize: 16.0,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
