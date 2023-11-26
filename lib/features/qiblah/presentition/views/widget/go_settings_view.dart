import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quran_app/core/util/color.dart';
import 'package:quran_app/core/util/widgets/my_text.dart';

class GoSettingsView extends StatelessWidget {
  const GoSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.kPrimaryColor,
            borderRadius: BorderRadius.circular(12.0)),
        child: MaterialButton(
          onPressed: () {
            openAppSettings().whenComplete(() {
              Get.back();
            });
          },
          child: MyText(
            text: 'Access Permissions',
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: 'Rubik',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
          ),
        ),
      ),
    );
  }
}
