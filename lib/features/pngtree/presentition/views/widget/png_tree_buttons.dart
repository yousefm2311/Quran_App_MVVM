import 'package:flutter/material.dart';
import 'package:quran_app/core/util/color.dart';
import 'package:quran_app/features/pngtree/presentition/view_model/pngTree_view_model.dart';

class PngTreeButtons extends StatelessWidget {
  const PngTreeButtons({super.key, required this.controller});

  final PngTreeViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            controller.clearConter();
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.restart_alt_rounded,
              size: 30,
            ),
          ),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () => controller.increaseCounter(),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.kPrimaryColor,
              boxShadow: [
                const BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(4, 4),
                  spreadRadius: 1,
                ),
                BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 5,
                    offset: const Offset(.5, 1),
                    spreadRadius: 3,
                    blurStyle: BlurStyle.inner),
                BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 5,
                    offset: const Offset(-1, -1),
                    spreadRadius: 3,
                    blurStyle: BlurStyle.inner),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () => controller.decreaseCounter(),
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(
              Icons.refresh_rounded,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
