// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:quran_app_android/core/util/widgets/my_text.dart';

class ClipPathWidget extends StatelessWidget {
  const ClipPathWidget({
    super.key,
    required this.index,
    required this.list,
  });

  final int index;
  final list;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperOne(reverse: true, flip: true),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .12,
        decoration: BoxDecoration(
          color: index == 0
              ? const Color.fromRGBO(111, 187, 195, 1)
              : index == 3
                  ? const Color.fromRGBO(221, 161, 194, 1)
                  : index == 1
                      ? const Color.fromRGBO(186, 155, 233, 1)
                      : const Color.fromRGBO(148, 190, 245, 1),
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                text: list,
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontFamily: 'Rubik',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}