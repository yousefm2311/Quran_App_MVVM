// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/util/widgets/custom_appBar.dart';
import 'package:quran_app/core/util/widgets/custom_back_button.dart';
import 'package:quran_app/features/pngtree/presentition/view_model/pngTree_view_model.dart';
import 'package:quran_app/features/pngtree/presentition/views/widget/png_tree_view_body.dart';

class PngTreeView extends GetWidget<PngTreeViewModel> {
  PngTreeView({super.key});
  PngTreeViewModel pngTreeViewModel =
      Get.put(PngTreeViewModel(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          loading: const CustomBackButton(),
          centerTitle: true,
          title: Text(
            'المسبحة الالكترونية',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik',
                  fontSize: 22.0,
                ),
          ),
        ),
        body: const PngTreeViewBody());
  }
}
