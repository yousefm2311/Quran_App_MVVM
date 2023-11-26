import 'package:flutter/material.dart';
import 'package:quran_app/core/util/assets.dart';

class AdhanContainer extends StatelessWidget {
  const AdhanContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        boxShadow: [
          const BoxShadow(
            color: Colors.black38,
            blurRadius: 8,
            offset: Offset(4, 4),
            spreadRadius: 1,
          ),
          const BoxShadow(
            color: Colors.white70,
            blurRadius: 10,
            offset: Offset(-4, -4),
            spreadRadius: 2,
          ),
          BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              offset: const Offset(.5, 1),
              spreadRadius: 3,
              blurStyle: BlurStyle.inner),
        ],
        color: Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
      child: Image.asset(AssetsData.ramadan),
    );
  }
}
