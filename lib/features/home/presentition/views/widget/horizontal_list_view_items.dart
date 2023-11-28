// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HorizontalListViewItems extends StatelessWidget {
  const HorizontalListViewItems({
    super.key,
    required this.pages,
    required this.index,
    required this.modelImage,
    required this.modelTitle,
  });
  final pages;
  final int index;
  final modelImage;
  final modelTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(pages);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white54,
              boxShadow: [
                const BoxShadow(
                  color: Colors.black38,
                  blurRadius: 1,
                  offset: Offset(2.2, 3.5),
                  spreadRadius: 1,
                ),
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                    offset: const Offset(.5, 1),
                    spreadRadius: 1,
                    blurStyle: BlurStyle.inner),
              ],
            ),
            width: 70,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                '$modelImage',
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "$modelTitle",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
        )
      ],
    );
  }
}
