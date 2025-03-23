// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app_android/features/home/presentition/views/widget/clip_path.dart';

class HomeGridViewItems extends StatelessWidget {
  const HomeGridViewItems({
    super.key,
    required this.page,
    required this.index,
    required this.image,
    required this.list,
  });
  final page;
  final int index;
  final image;
  final list;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(page);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 20,
                blurStyle: BlurStyle.outer,
                spreadRadius: BorderSide.strokeAlignCenter,
              )
            ],
            gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: gridViewColorGradient(),
              tileMode: TileMode.clamp,
              stops: const [0.0, 1.0],
            ),
            borderRadius: BorderRadius.circular(
              25.0,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Image.asset(
                  image,
                  height: MediaQuery.of(context).size.height * .08,
                ),
              ),
              ClipPathWidget(index: index, list: list)
            ],
          ),
        ),
      ),
    );
  }

  List<Color> gridViewColorGradient() {
    return index == 0
        ? [
            const Color.fromRGBO(79, 172, 202, 1),
            const Color.fromRGBO(111, 187, 195, 1),
          ]
        : index == 3
            ? [
                const Color.fromARGB(255, 207, 115, 181),
                const Color.fromRGBO(221, 161, 194, 1),
              ]
            : index == 1
                ? [
                    const Color.fromARGB(255, 199, 130, 220),
                    const Color.fromARGB(255, 180, 144, 233),
                  ]
                : [
                    const Color.fromARGB(255, 118, 148, 232),
                    const Color.fromARGB(255, 137, 183, 244),
                  ];
  }
}