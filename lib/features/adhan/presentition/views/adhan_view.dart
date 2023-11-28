import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/util/color.dart';
import 'package:quran_app/core/util/widgets/custom_appBar.dart';
import 'package:quran_app/core/util/widgets/custom_back_button.dart';
import 'package:quran_app/core/util/widgets/my_text.dart';
import 'package:quran_app/features/adhan/presentition/view_model/adhan_view_model.dart';
import 'package:quran_app/features/adhan/presentition/views/widget/adhan_body_view.dart';

class AdhanView extends GetWidget<AdhanViewModel> {
  const AdhanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        loading: const CustomBackButton(),
        title: MyText(
          text: 'مواقيت الصلاة ',
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'Rubik',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<AdhanViewModel>(
        builder: (controller) {
          if (controller.prayerTimes == null) {
            controller.requestLocationPermission();
          }
          return controller.prayerTimes != null
              ? const AdhanBodyView()
              : Center(
                  child: MaterialButton(
                  color: AppColors.kPrimaryColor,
                  onPressed: () {
                    controller.requestLocationPermission();
                  },
                  child: Text(
                    'Get Data',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 20, color: Colors.white),
                  ),
                ));
        },
      ),
    );
  }
}
