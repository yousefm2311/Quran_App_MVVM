import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/core/util/icon_broken.dart';
import 'package:quran_app_android/features/adhan/presentition/view_model/adhan_view_model.dart';
import 'package:quran_app_android/features/adhan/presentition/views/widget/adhan_body_list_view.dart';
import 'package:quran_app_android/features/adhan/presentition/views/widget/container_adhan.dart';
class AdhanBodyView extends StatelessWidget {
  const AdhanBodyView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdhanViewModel>(
        init: AdhanViewModel(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20.0),
              AdhanContainer(
                prayerTimes: controller.prayerTimes,
              ),
              const SizedBox(height: 15.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Icon(
                      IconBroken.Time_Circle,
                      size: 35,
                    ),
                    Spacer(),
                    Icon(
                      IconBroken.Calendar,
                      size: 35,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              AdhanBodyListView(
                controller: controller,
              )
            ],
          );
        });
  }
}
