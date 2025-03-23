// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app_android/core/util/assets.dart';
class NotifyView extends StatelessWidget {
  const NotifyView({super.key, this.payload});

  final String? payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Lottie.asset(AssetsData.coming),
      ),
    );
  }
}
