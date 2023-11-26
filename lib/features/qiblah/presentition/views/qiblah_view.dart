import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/util/widgets/custom_appBar.dart';
import 'package:quran_app/core/util/widgets/custom_back_button.dart';
import 'package:quran_app/core/util/widgets/my_text.dart';
import 'package:quran_app/features/qiblah/presentition/view_model/qiblah_view_model.dart';
import 'package:quran_app/features/qiblah/presentition/views/widget/go_settings_view.dart';
import 'package:quran_app/features/qiblah/presentition/views/widget/qiblah_stream_builder.dart';

class QiblahView extends StatefulWidget {
  const QiblahView({super.key});
  @override
  State<QiblahView> createState() => _QiblahViewState();
}

Animation<double>? animation;
AnimationController? animationController;
double begin = 0.0;
class _QiblahViewState extends State<QiblahView>
    with SingleTickerProviderStateMixin {
  QiblahViewModel qiblahViewModel = Get.put(QiblahViewModel());
  @override
  void initState() {
    qiblahViewModel.requestLocationPermission(context);
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(animationController!);
    super.initState();
  }
  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QiblahViewModel>(builder: (control) {
      return Scaffold(
          appBar: CustomAppBar(
            loading: const CustomBackButton(),
            title: MyText(
              text: 'القبلة',
              textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontFamily: 'Rubik',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
            ),
            centerTitle: true,
          ),
          body: control.isDone.value
              ? const QiblahStreamBuilder()
              : const GoSettingsView());
    });
  }
}
