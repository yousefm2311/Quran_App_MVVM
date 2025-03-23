import 'package:flutter/material.dart';
import 'package:quran_app_android/core/util/color.dart';
import 'package:readmore/readmore.dart';

class ReadMore extends StatelessWidget {
  const ReadMore({
    super.key,
    required this.tafseerModel,
  });

  // ignore: prefer_typing_uninitialized_variables
  final tafseerModel;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      tafseerModel.text,
      trimLines: 2,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.black54,
      ),
      textAlign: TextAlign.justify,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Show More',
      trimExpandedText: 'Show Less',
      textDirection: TextDirection.rtl,
      lessStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: AppColors.kPrimaryColor,
      ),
      moreStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.kPrimaryColor,
      ),
    );
  }
}
