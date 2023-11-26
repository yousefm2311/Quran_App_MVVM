import 'package:flutter/material.dart';
import 'package:quran_app/features/home/presentition/view_model/home_view_model.dart';
import 'package:quran_app/features/home/presentition/views/widget/home_grid_view_items.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key, required this.controller});
  final HomeViewModel controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return StaggeredGridView.countBuilder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return HomeGridViewItems(
                    page: controller.routes[index],
                    index: index,
                    image: controller.images[index],
                    list: controller.titles[index]);
              },
              crossAxisCount: 2,
              itemCount: 4,
              mainAxisSpacing: 0.0,
              staggeredTileBuilder: (int index) {
                return StaggeredTile.count(
                  1,
                  index.isEven
                      ? MediaQuery.sizeOf(context).height * 0.00156
                      : MediaQuery.sizeOf(context).height * 0.0014,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
