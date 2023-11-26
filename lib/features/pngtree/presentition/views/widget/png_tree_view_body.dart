import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quran_app/features/pngtree/presentition/view_model/pngTree_view_model.dart';
import 'package:quran_app/features/pngtree/presentition/views/widget/circular_step_progress_indicator.dart';
import 'package:quran_app/features/pngtree/presentition/views/widget/png_tree_buttons.dart';
import 'package:quran_app/features/pngtree/presentition/views/widget/section_total_text_png_tree.dart';

class PngTreeViewBody extends StatelessWidget {
  const PngTreeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GetBuilder<PngTreeViewModel>(builder: (control) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SectionTotalText(controller: control),
            CircularStepProgressIndicatorView(controller: control),
            PngTreeButtons(controller: control),
            const SizedBox(height: 40),
          ],
        );
      }),
    );
  }
}
