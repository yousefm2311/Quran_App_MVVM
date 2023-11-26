import 'package:flutter/material.dart';
import 'package:quran_app/features/home/presentition/view_model/home_view_model.dart';
import 'package:quran_app/features/home/presentition/views/widget/horizontal_list_view_items.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({super.key, required this.controller});
  final HomeViewModel controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 110,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: HorizontalListViewItems(
                  index: index,
                  pages: controller.routesListView[index],
                  modelImage: controller.imageListView[index],
                  modelTitle: controller.titleListView[index],
                ));
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * .048,
            );
          },
          itemCount: controller.titleListView.length,
        ),
      ),
    );
  }
}
