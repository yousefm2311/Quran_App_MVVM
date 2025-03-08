// ignore_for_file: non_constant_identifier_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/service/settings/SettingsServices.dart';
import 'package:quran_app/core/util/color.dart';
import 'package:quran_app/core/util/routes/routes.dart';
import 'package:quran_app/core/util/widgets/custom_appBar.dart';
import 'package:quran_app/core/util/widgets/my_text.dart';
import 'package:quran_app/features/adhan/presentition/view_model/adhan_view_model.dart';
import 'package:quran_app/features/home/presentition/views/widget/container_last_read.dart';
import 'package:quran_app/features/home/presentition/views/widget/home_grid_view.dart';
import 'package:quran_app/features/home/presentition/views/widget/horizontal_list_view.dart';
import 'package:quran_app/features/home/presentition/view_model/home_view_model.dart';
import 'package:quran_app/core/util/icon_broken.dart';


class HomeView extends GetWidget<HomeViewModel> {


  SettingsServices settingsServices = Get.put(SettingsServices());
  AdhanViewModel adhanViewModel = Get.put(AdhanViewModel());

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackGroundColor,
      appBar: CustomAppBar(
        loading: IconButton(
          onPressed: () async {
            // Get.bottomSheet(BottomsheetBody(
            //     controller: controller, settingsServices: settingsServices));
            Get.toNamed(AppRoutes.settings);
          },
          icon: const Icon(IconBroken.Setting),
        ),
        color: AppColors.kbackGroundColor,
        title: MyText(
          text: 'الصفحة الرئيسية',
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFamily: 'Rubik',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 1.06,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HorizontalListView(controller: controller),
              ContainerLastReadView(settingsServices: settingsServices),
              HomeGridView(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
